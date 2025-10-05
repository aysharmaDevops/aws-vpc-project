# 🏗️ AWS VPC Automation Project  

Hands-on AWS networking project building a secure VPC with public/private subnets, Internet/NAT gateways, and automated routing via AWS CLI.

**Author:** Ayush Sharma  
**Track:** AWS Cloud + DevOps | Hands-on Project  
**Repository:** [aws-vpc-project](https://github.com/aysharmaDevops/aws-vpc-project)

---

## 🌐 Project Overview

This project automates the creation of a **secure and scalable AWS Virtual Private Cloud (VPC)** using **AWS CLI and Bash scripting**.  
It demonstrates practical understanding of **network segmentation, routing, and automation** — key competencies for **AWS Solutions Architect** and **DevOps Engineer** roles.

The entire infrastructure was created and version-controlled using **Git & GitHub**, reflecting **real-world best practices** followed by cloud professionals.

---

## 🧩 Architecture Summary

The following AWS components are provisioned automatically:

| Component | Description |
|------------|--------------|
| 🕸️ **VPC** | Custom VPC (`10.0.0.0/16`) created for isolation |
| 🌍 **Public Subnet** | Internet-facing subnet for public resources |
| 🔒 **Private Subnet** | Internal subnet with restricted access |
| 🌐 **Internet Gateway (IGW)** | Enables public internet connectivity |
| 🔁 **NAT Gateway** | Allows private instances secure outbound access |
| 🧭 **Route Tables** | Configured for both public and private subnet routing |
| 🖥️ **EC2 (optional extension)** | Can be deployed later into public/private subnets |

---

## 🧠 Architecture Diagram

Below is the conceptual diagram of the VPC environment:

pgsql
Copy code
               +-------------------------------------+
               |          Ayush-VPC (10.0.0.0/16)    |
               |                                     |
               |   +----------------------------+    |
               |   | Public Subnet (10.0.1.0/24)|    |
               |   | IGW → Internet             |    |
               |   +----------------------------+    |
               |                                     |
               |   +----------------------------+    |
               |   | Private Subnet (10.0.2.0/24)|   |
               |   | NAT Gateway → Internet      |   |
               |   +----------------------------+    |
               +-------------------------------------+
yaml
Copy code

📘 *Alternatively, see full architecture image below:*  
![AWS VPC Architecture](diagrams/aws_vpc_architecture.png)

---

## ⚙️ Automation Scripts

Each stage of the VPC build is modularized into scripts for reusability.

| Script Name | Description |
|--------------|-------------|
| `01_create_vpc.sh` | Creates the VPC and applies project tag |
| `02_create_subnets.sh` | Creates and tags both public and private subnets |
| `03_create_igw_and_routes.sh` | Attaches Internet Gateway and configures public routing |
| `04_nat_and_private_routes.sh` | Launches NAT Gateway and configures private routing |

All scripts are written in **Bash** and executed via **AWS CLI** — designed for easy reuse and CI/CD integration.

---

## 💾 Output Samples

To maintain security, all AWS resource IDs have been masked in outputs.  
You can review them in:

📂 [`outputs/cli_outputs_masked.txt`](outputs/cli_outputs_masked.txt)

Example:
```bash
Creating VPC (10.0.0.0/16)...
Created VPC ID: vpc-xxxxxxxxxxxxx
Created Subnet IDs: subnet-xxxxxxxxx, subnet-yyyyyyyyy
Created Internet Gateway ID: igw-xxxxxxxxx
Created NAT Gateway ID: nat-xxxxxxxxx
🧠 Key Concepts Demonstrated
✅ AWS VPC and CIDR Block Planning
✅ Subnet Segmentation (Public vs. Private)
✅ Internet Gateway & NAT Gateway Configuration
✅ Route Table Association
✅ AWS CLI Automation with Shell Scripting
✅ Infrastructure Version Control (Git)
✅ Documentation and Presentation for Cloud Portfolios

🧰 Tools & Technologies Used
Category	Tool
☁️ Cloud Provider	Amazon Web Services (AWS)
🧑‍💻 Automation	AWS CLI, Bash
📘 Documentation	Markdown, GitHub Pages
🔒 Security	Masked resource outputs
📦 Version Control	Git, GitHub
🧩 Diagram	Draw.io / Lucidchart

💼 Use Case — For Manager / Client Review
This repository demonstrates:

Real AWS hands-on implementation aligned with professional certification tracks

Automation-first approach instead of manual console configuration

Security-conscious network design (public/private separation + NAT)

Clear, versioned documentation — like enterprise DevOps repositories

Scalable foundation for adding EC2, S3, ALB, or CI/CD pipelines later

💬 This project proves practical AWS proficiency and readiness for cloud automation tasks.

📊 Project Folder Structure
graphql
Copy code
aws-vpc-project/
├── diagrams/                     # Architecture diagrams
│   └── aws_vpc_architecture.png
├── outputs/                      # AWS CLI command outputs (masked)
│   └── cli_outputs_masked.txt
├── scripts/                      # Automation scripts for each component
│   ├── 01_create_vpc.sh
│   ├── 02_create_subnets.sh
│   ├── 03_create_igw_and_routes.sh
│   └── 04_nat_and_private_routes.sh
├── LICENSE
└── README.md
🔮 Next Steps / Planned Enhancements
 Add EC2 instance deployment in both subnets

 Add S3 bucket for static website hosting

 Implement Terraform IaC version

 Integrate GitHub Actions for CI/CD pipeline

 Add CloudWatch monitoring dashboard

🏁 Results Snapshot
Below is an example of the final AWS environment (representational view):

java
Copy code
VPC: Ayush-VPC (10.0.0.0/16)
├── Public Subnet (10.0.1.0/24)
│   ├── Internet Gateway (IGW)
│   └── Route Table → 0.0.0.0/0 via IGW
├── Private Subnet (10.0.2.0/24)
│   ├── NAT Gateway (EIP attached)
│   └── Route Table → 0.0.0.0/0 via NAT
🧾 License
This project is licensed under the MIT License — free for learning and demonstration purposes.
See LICENSE for details.

🧑‍💻 Connect with Me
Ayush Sharma
📧 ayush.87sharma@gmail.com
🌐 LinkedIn
💻 GitHub

“One day, one step, one win at a time — I am building my future.”

⭐ If you found this project helpful, consider giving it a star on GitHub!
