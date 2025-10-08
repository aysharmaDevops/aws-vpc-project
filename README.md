# AWS Multi-AZ VPC Automation using PowerShell

<p align="center">
  <img src="https://via.placeholder.com/1200x300.png?text=Ayush+Sharma+-+AWS+%26+PowerShell+Automation" alt="Ayush Sharma - AWS & PowerShell Automation" width="100%">
</p>

## 🚀 Overview
This project automates a **Multi-AZ AWS VPC setup** using **PowerShell**, designed for enterprise-grade reliability and scalability.  
It demonstrates how to create a **VPC**, **public and private subnets**, **NAT gateways**, **route tables**, **security groups**, and **NACLs** — both manually and via automation.

## 🧠 Architecture Diagram
<p align="center">
  <img src="https://via.placeholder.com/1000x600.png?text=AWS+Multi-AZ+VPC+Architecture" alt="AWS Multi-AZ Architecture Diagram" width="90%">
</p>

## 🧩 Key Components
- VPC with CIDR block `10.0.0.0/16`
- 2 Availability Zones (us-east-1a, us-east-1b)
- 1 Public Subnet, 2 Private Subnets
- Internet Gateway & NAT Gateway per AZ
- Security Groups & NACLs for layered security
- PowerShell automation scripts with cleanup utilities

## 🧰 Files Included
- `PowerShell-Automation/FULLBUILD.ps1` → Complete infra creation script
- `PowerShell-Automation/cleanup.ps1` → Safe teardown script
- `PowerShell-Automation/images/banner.png` → Placeholder banner (replace later)
- `PowerShell-Automation/images/aws-vpc-architecture.png` → Placeholder diagram (replace later)

## 🧾 Cost Awareness Note
This project follows **AWS best practices for cost optimization** and uses free-tier or short-lived resources only.

## 🧪 Demo Output
Below is a sample of console output when the script runs:
Creating VPC: 10.0.0.0/16
Creating Public Subnet in us-east-1a
Creating Private Subnet in us-east-1b
Attaching Internet Gateway…
Setting up NAT Gateway…
Creating Route Tables…
Associating Subnets and Routes…
✅ Deployment Complete!

## 📬 Connect with Me
**Ayush Sharma** — *Cloud Solutions Architect | PowerShell & AWS Specialist*  
📧 Email: [Ayush.87sharma@hotmail.com](mailto:Ayush.87sharma@hotmail.com)  
🌐 LinkedIn: [linkedin.com/in/ayush-sharma-575010102](https://www.linkedin.com/in/ayush-sharma-575010102)
