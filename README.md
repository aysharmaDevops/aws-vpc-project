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

## 🌐 Overview
This project automates the creation of a *highly available Multi-AZ AWS VPC* environment using PowerShell and AWS CLI. It’s designed to be easily reproducible, scalable, and ideal for DevOps engineers, cloud labs, or freelancing projects.

---


---

## 🏗️ Infrastructure Components

The automated PowerShell scripts build the following:

| Component | Description |
|------------|-------------|
| *VPC* | Creates a custom VPC with a /16 CIDR range |
| *Subnets* | Public + Private subnets across multiple Availability Zones |
| *Internet Gateway (IGW)* | Enables public subnet internet access |
| *NAT Gateway* | Provides outbound access for private subnets |
| *Route Tables* | Public & Private route tables with associations |
| *Security Groups* | Granular ingress/egress traffic control |
| *Network ACLs* | Stateless traffic filtering for public and private layers |

---

## 🧠 Project Structure

aws-vpc-project/
├── diagrams/                   # Architecture visuals
├── outputs/                    # Execution outputs (optional)
├── scripts/                    # Placeholder for additional code
└── PowerShell-Automation/      # Automation logic
├── Ayush-VPC-FullBuild.ps1
├── cleanup.ps1
└── README.md

## ⚙️ PowerShell Automation Scripts

### 1️⃣ Ayush-VPC-FullBuild.ps1
> Provisions a complete AWS VPC setup (Multi-AZ with subnets, NAT, SGs, NACLs, etc.)

*Usage:*
```powershell
powershell -ExecutionPolicy Bypass -File .\Ayush-VPC-FullBuild.ps1

2️⃣ cleanup.ps1

Safely deletes all chargeable AWS resources (NAT, Elastic IPs, VPC) in one go.
Usage:
powershell -ExecutionPolicy Bypass -File .\cleanup.ps1

📊 Example Output

Once completed, the script displays:
✅ SETUP COMPLETE!
VPC: vpc-xxxxxxxxxxxxxxxxx
Public Subnet: subnet-xxxxxxxxxxxxxxx
Private Subnets: subnet-xxxxxx, subnet-xxxxxx
IGW: igw-xxxxxxxxxxxxx
NAT: nat-xxxxxxxxxxxxx
Public SG: sg-xxxxxxxxxxxxx
Private SG: sg-xxxxxxxxxxxxx
Public NACL: acl-xxxxxxxxxxxxx
Private NACL: acl-xxxxxxxxxxxxx

🖼️ Architecture Diagram (Planned)

A visual AWS architecture diagram will be added under
PowerShell-Automation/images/architecture.png

It will illustrate:
	•	VPC across two AZs
	•	Public and private subnets
	•	IGW + NAT
	•	Route tables, SGs, and NACLs

⸻

🧰 Prerequisites
	•	AWS CLI v2.31+
	•	PowerShell v5.1+
	•	IAM user with sufficient permissions (AmazonVPCFullAccess, EC2FullAccess)
•	AWS credentials configured via:
aws configure

📬 Contact

💼 Ayush Sharma
📧 ayush.87sharma@hotmail.com
🔗 LinkedIn Profile

⸻

Automating AWS Infrastructure the Right Way — with PowerShell Precision ⚡
### Step 2️⃣ — Commit the Changes
1. Scroll down.
2. Commit message:
docs: enhance project README for client presentation
3. Click *Commit changes* ✅

---

### Step 3️⃣ — Confirm the Repo Layout
Your repo should now look like this:
aws-vpc-project/
├── PowerShell-Automation/
│   ├── Ayush-VPC-FullBuild.ps1
│   ├── cleanup.ps1
│   └── README.md
├── diagrams/
├── outputs/
├── scripts/
├── LICENSE
└── README.md
