### Highly Available Multi-Tier Web Application with Auto Scaling and Load Balance on AWS

## Project Overview: 


## Prerequisites:


![Project-08 Architecture](images/Project-08.drawio.png)

## Step-by-Step Implementation:

### Step 1 - Create VPC and subnets including Internet & Nat gateway, Routing Table.

### Step 2 -  Create Web Security Group to allow HTTP

### Step 3 -  Create Web EC2 instance and Connect to RDS
### a. Create DB security group
### b. Create DB Subnet group
### c. Create AWS RDS instance
### d. Connect to RDS Database

### Step 4 - Create an Amazon Machine Image (AMI) from the running EC2 instance

### Step 5 - Create a load balancer
### a. Create Target Group
### b. Create Load Balance

### Step 6 - Create a launch configuration and an Auto Scaling group
### a. Automatically scale new instances within a private subnet
### b. Create Amazon CloudWatch alarms and monitor performance of your infrastructure

### Step 7. Create trigger to test Autoscaling