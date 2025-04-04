# Terraform AWS EC2 Setup with VPC, Subnet, Security Group, and Flask App Deployment

## Overview

This project uses Terraform to provision an AWS infrastructure that includes:
- A Virtual Private Cloud (VPC)
- A public subnet
- An Internet Gateway and Route Table for internet access
- A Security Group allowing SSH and HTTP traffic
- An EC2 instance with a key pair
- Deployment of a Flask application on the EC2 instance

## Resources Created
- **VPC:** 10.0.0.0/16
- **Subnet:** 10.0.0.0/24 (public subnet in `us-east-1a`)
- **Internet Gateway:** Enables internet access for the VPC
- **Route Table:** Routes traffic to the Internet Gateway
- **Security Group:** Allows incoming traffic on ports 22 (SSH) and 80 (HTTP)
- **Key Pair:** SSH key pair created from a local public key
- **EC2 Instance:** `t2.micro` Ubuntu instance running a Flask app

## File Structure
- `main.tf` — Terraform configuration file
- `app.py` — Flask application file (to be copied to the EC2 instance)
- `README.md` — Instructions to run the project
- `output.tf` — Outputs information about the created resources

## Setup Instructions

### Prerequisites
- AWS CLI configured with appropriate permissions
- Terraform installed
- SSH key pair available locally (`id_rsa` and `id_rsa.pub`)
  - To generate: 
    ```bash
    ssh-keygen -t rsa
    ```
    Follow the prompts and save your key files. Update the Terraform code with the correct key paths.
- A sample `app.py` file ready for deployment

# Steps to Deploy Terraform Infrastructure

## 1. Initialize Terraform
```bash
terraform init
```
![Initialize Terraform](https://github.com/user-attachments/assets/7601f200-b638-4309-b724-e9e474335350)

## 2. Planning the Infrastructure
```bash
terraform plan
```
> **Note:** Running this command will show what resources will be created.

![Planning Infrastructure](https://github.com/user-attachments/assets/77505449-e6d5-4dca-833b-62fbb796f84c)

## 3. Apply the Configuration
```bash
terraform apply
```
> **Tip:** You can use the `--auto-approve` flag to skip the manual approval step.

![Apply Configuration](https://github.com/user-attachments/assets/3a85ede9-478f-4673-81f8-bc4127e9880c)

## 4. Access the Deployed Application
SSH into your EC2 instance:
```bash
ssh -i /home/your_username/.ssh/id_rsa ubuntu@<your-ec2-public-ip>
```
> **Replace** `/home/your_username/.ssh/id_rsa` with your private key path and `<your-ec2-public-ip>` with the actual EC2 public IP.

After logging in, run your application:
```bash
# Example command (modify as per your app)
python3 app.py
```

![SSH Access](https://github.com/user-attachments/assets/970b3c68-5e51-48e2-a45e-e0301393d700)
![Running App](https://github.com/user-attachments/assets/b63c5ad8-fd7a-4fed-8e6f-b25beae3e5ad)

## Key Points
- The public key is read from `/home/your_username/.ssh/id_rsa.pub`.
- The private key is used for SSH connections from `/home/your_username/.ssh/id_rsa`.
- The EC2 instance installs Python3, pip3, Flask, and runs `app.py` automatically after instance creation.
- **Security Group is open to the world (0.0.0.0/0)** for both HTTP and SSH — use with caution in production environments.

## Cleanup
To destroy all resources created by Terraform:
```bash
terraform destroy
```
![Destroy Infrastructure](https://github.com/user-attachments/assets/0b7607bc-88e2-498d-84e6-dd88676cc9c8)

## Important Note
> After you run `terraform apply`, Terraform will create a **state file** (`terraform.tfstate`).
>
> This file contains all infrastructure details and sensitive information.
>
> **Never upload your state file to public repositories like GitHub.**

![State File Warning](https://github.com/user-attachments/assets/e8f7ed13-94de-4763-a606-e8e6d780f0de)





