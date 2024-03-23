# Automated Backup System using Rsync

### Project Overview:
In this project, we'll create an automated backup system using rsync to synchronize files and directories between two Ubuntu servers. One server will act as the source server, containing the files to be backed up, and the other server will serve as the destination server, where the backups will be stored. We'll schedule regular backups using cron jobs and configure email notifications for backup completion or failure.


### Prerequisites:
- Two Ubuntu servers (source and destination)
- SSH access to both servers
- Basic knowledge of Linux command line


### Step-by-Step Implementation:

### Step-1 : Setup Source and destination servers on AWS. 


![servers](images/servers.png)

- Install Rysnc on both servers

```
sudo apt update

sudo apt install rsync
```

### Step-2 : Configure SSH Key-based Authentication:



- Set up SSH key-based authentication between the source and destination servers to allow secure communication without password prompts.

- Generate an SSH key pair on the source server:

```
ssh-keygen -t rsa
```

- Use ssh-copy-id to copy the public ip to the destination server 

```
ssh-copy-id username@target_server_ip_address
```

_if the above method doesn't work try copying it manually_

```
cat ~/.ssh/id_rsa.pub
```

- Copy the displayed text

- Run the command below in the destination sever

```
echo "your_copied_public_key_here" >> ~/.ssh/authorized_keys
```

- Change permission of authorized_keys 

```
chmod 600 ~/.ssh/authorized_keys
```
- Once the public key has been copied try connecting to the destination server using SSH from the source server:

```
ssh username@target_server_ip_address
```

### Step-3 : Create Backup Script:


- Create a backup script in the source server

```
vi backup.sh
```

- Here is a basic example don't forget to modify the parameters.

```
#!/bin/bash

set -x
set -e


# Define source and destination directories
SRC_DIR="/path/to/source"
DEST_HOST="username@destination_server_ip"
DEST_DIR="/path/to/destination"

# Rsync command to synchronize files and directories
rsync -avz --delete $SRC_DIR $DEST_HOST:$DEST_DIR

# Check rsync exit status
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    
else
    echo "Backup failed!"
   
fi

```

- Save the script and exit. 

- Make the script executable:

```
chmod +x backup.sh
```

### Step-4 : Schedule Backup with Cron:

- Edit the crontab file to schedule regular backups:

```
crontab -e
```
- Add a cron job to execute the backup script at the desired interval. for every 2hours:

```
0 */2 * * * /path/to/backup.sh
```
