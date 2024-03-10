# Implementing a LAMP STACK

This project sets up LAMP STACK used to Host dynamic web application

## Steps

- Created an ec2 instance

##  Installing Apache and Updating the Firewall

- Updated the package manager 

```
Sudo apt update
```

- Installed Apache

```
Sudo apt install apache2
```

- Confirmed that apache is running 

```
sudo systemctl status apache2
```

![Apache_Status](images/apache-running.png)


_The image above shows that apache2 is running sucessfully_