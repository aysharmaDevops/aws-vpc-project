<p align="center">
  <img src="https://via.placeholder.com/1200x300/0a2540/ffffff?text=Ayush+Sharma+-+Cloud+Solutions+Architect+%7C+PowerShell+%26+AWS+Specialist" 
       alt="Ayush Sharma - Cloud Solutions Architect | PowerShell & AWS Specialist" 
       width="100%">
</p>

<h1 align="center">🚀 AWS Multi-AZ VPC Automation using PowerShell</h1>

<p align="center">
  <strong>Author:</strong> <a href="https://www.linkedin.com/in/ayush-sharma-575010102">Ayush Sharma</a><br>
  <em>Cloud Solutions Architect | PowerShell & AWS Specialist</em><br>
  📧 <a href="mailto:ayush.87sharma@hotmail.com">ayush.87sharma@hotmail.com</a>
</p>

<p align="center">
  <a href="https://docs.microsoft.com/powershell/">
    <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell Badge"/>
  </a>
  <a href="https://aws.amazon.com/">
    <img src="https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Badge"/>
  </a>
  <img src="https://img.shields.io/badge/Automation-4CAF50?style=for-the-badge&logo=windows-terminal&logoColor=white" alt="Automation Badge"/>
  <img src="https://img.shields.io/badge/IaC-Purple?style=for-the-badge&logo=azuredevops&logoColor=white" alt="IaC Badge"/>
</p>

---

Overview:

This project automates the creation of a highly available Multi-AZ AWS VPC environment using PowerShell

and AWS CLI.

It is designed to be easily reproducible, scalable, and ideal for DevOps engineers, cloud labs, or freelancing

clients who need a consistent AWS base network setup.

---

Components Created:

VPC: 10.0.0.0/16

Subnets: 1 Public (AZ-a) + 2 Private (AZ-b, AZ-c)

IGW + NAT: Internet and private connectivity

Route Tables: Public RT (IGW) + Private RT (NAT)

Security Groups: Public (SSH/HTTP/HTTPS) + Private (internal only)

NACLs: Public = open, Private = restricted

---

Prerequisites:- AWS CLI v2.31+

- PowerShell v5.1+

- IAM user with sufficient permissions (AmazonVPCFullAccess, EC2FullAccess)

- AWS credentials configured via: aws configure

---

Script Files:

Ayush-VPC-FullBuild.ps1 -> Creates entire Multi-AZ VPC setup with all components

cleanup.ps1 -> Safely deletes all created resources to reset environment

---

Demo Output:

SETUP COMPLETE!

VPC: vpc-0a12b345c678d90ef

Public Subnet: subnet-0a1b2c3d4e5f67890

Private Subnets: subnet-0123abcd4567efgh, subnet-0987fedc6543cba21

IGW: igw-012abc345def67890

NAT: nat-0123abcd4567efgh

Public SG: sg-01a2b3c4d5e6f7g8h

Private SG: sg-0123456789abcdef0

Public NACL: acl-0123abcd4567efgh

Private NACL: acl-0123abcd4567efgh

All resources are automatically tagged and configured to provide:

- Multi-AZ redundancy

- Public/Private routing separation

- Security group and NACL isolation

- One-command teardown via the cleanup script

---Cleanup Script:

To safely remove all generated resources:

powershell.exe -ExecutionPolicy Bypass -File .\cleanup.ps1

This ensures your AWS environment stays cost-efficient and reusable.

---

About the Author:

Ayush Sharma

Cloud Solutions Architect | PowerShell & AWS Specialist

Email: ayush.87sharma@hotmail.com

LinkedIn: https://www.linkedin.com/in/ayush-sharma-575010102

GitHub: https://github.com/aysharmaDevops

If you are looking for AWS infrastructure automation or IaC implementation using PowerShell or CLI, let's

connect!

---

