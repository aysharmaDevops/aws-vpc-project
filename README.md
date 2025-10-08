# AWS Multi-AZ VPC Automation using PowerShell
End-to-end AWS networking automation using PowerShell | Infrastructure-as-Code | DevOps-ready

<p align="center">
  <img src="https://via.placeholder.com/1200x300/FFF4E0/FF9900?text=Ayush+Sharma+-+AWS+Multi-AZ+VPC+Automation+%7C+PowerShell+%26+Cloud+Architect" alt="Ayush Sharma AWS PowerShell Automation Banner" width="100%">
</p>

## 💼 Project Highlights
- Fully automated AWS VPC setup using PowerShell
- Covers multi-AZ architecture, route tables, NACLs, and security groups
- Includes teardown script for cost-efficient reusability
- Ideal reference for DevOps interviews and freelance AWS automation tasks

## 🚀 Overview
This project automates a **Multi-AZ AWS VPC setup** using **PowerShell**, designed for enterprise-grade reliability and scalability.  
It demonstrates how to create a **VPC**, **public and private subnets**, **NAT gateways**, **route tables**, **security groups**, and **NACLs** — both manually and via automation.

“Unlike Terraform, this project demonstrates AWS resource automation purely via PowerShell and AWS CLI — ideal for Windows-based DevOps pipelines.”

## 🧠 Architecture Diagram
<p align="center">
  <img src="https://via.placeholder.com/1000x600.png?text=AWS+Multi-AZ+VPC+Architecture" alt="AWS Multi-AZ Architecture Diagram" width="90%">
</p>

---

## 🧩 Prerequisites

Before running the PowerShell automation scripts, ensure the following requirements are met:

- *AWS CLI v2.3+* installed and configured  
- *PowerShell v5.1+* (Windows) or *PowerShell Core (7+)* (Linux/macOS)  
- *IAM user with permissions* for:
  - AmazonVPCFullAccess
  - EC2FullAccess
- *AWS credentials configured* via:
  ```bash
  aws configure

## 🧩 Key Components
“Subnets distributed across multiple AZs ensure fault tolerance and scalability.”

- VPC with CIDR block `10.0.0.0/16`
- 2 Availability Zones (us-east-1a, us-east-1b)
- 1 Public Subnet, 2 Private Subnets
- Internet Gateway & NAT Gateway per AZ
- Security Groups & NACLs for layered security
- PowerShell automation scripts with cleanup utilities

- 

## 🧰 Files Included
- `PowerShell-Automation/FULLBUILD.ps1` → Complete infra creation script
- `PowerShell-Automation/cleanup.ps1` → Safe teardown script
- `PowerShell-Automation/images/banner.png` → Placeholder banner (replace later)
- `PowerShell-Automation/images/aws-vpc-architecture.png` → Placeholder diagram (replace later)

---

## 🧪 Demo Output

Below is a sample of the console output generated when running the Ayush-VPC-FullBuild.ps1 automation script:

Creating VPC: 10.0.0.0/16
✅ VPC created: vpc-042d1d117b588c730

Creating Public Subnet in us-east-1a…
✅ Public Subnet created: subnet-0a82cb55a93068f54

Creating Private Subnet in us-east-1b…
✅ Private Subnet created: subnet-0ada16ac5c964f089

Creating Private Subnet in us-east-1c…
✅ Private Subnet created: subnet-0e931575564631d10

Attaching Internet Gateway…
✅ IGW attached: igw-0632fdba709221039

Creating NAT Gateway…
✅ NAT Gateway created: nat-0bcd7383d6c0bf071

Creating Route Tables…
✅ Public RT created and associated
✅ Private RT created and associated

Creating Security Groups…
✅ Public SG: sg-0c942a2e3a17acf9b
✅ Private SG: sg-058e1c5e8e690f017

Creating and Associating Network ACLs…
✅ Public NACL: acl-01e2acda05ce641e6
✅ Private NACL: acl-048177a085bff24c7

✅ SETUP COMPLETE!

Resources Created:
────────────────────────────
VPC ID: vpc-042d1d117b588c730
Public Subnet: subnet-0a82cb55a93068f54
Private Subnets: subnet-0ada16ac5c964f089, subnet-0e931575564631d10
IGW: igw-0632fdba709221039
NAT: nat-0bcd7383d6c0bf071
Public SG: sg-0c942a2e3a17acf9b
Private SG: sg-058e1c5e8e690f017
Public NACL: acl-01e2acda05ce641e6
Private NACL: acl-048177a085bff24c7
────────────────────────────

## 🧾 Cost Awareness Note
This project follows **AWS best practices for cost optimization** and uses free-tier or short-lived resources only.



## 📬 Connect with Me
**Ayush Sharma** — *Cloud Solutions Architect | PowerShell & AWS Specialist*  
📧 Email: [Ayush.87sharma@hotmail.com](mailto:Ayush.87sharma@hotmail.com)  
🌐 LinkedIn: [linkedin.com/in/ayush-sharma-575010102](https://www.linkedin.com/in/ayush-sharma-575010102)
