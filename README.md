# AWS VPC: Public + Private Subnets + NAT (Demo - Masked IDs)

**Status:** Ready for GitHub (all IDs masked for safe public sharing)

## Overview
This repository documents a hands-on lab that creates a custom VPC with both public and private subnets,
an Internet Gateway, a NAT Gateway, route tables, and the CLI commands used to verify the configuration.
All real AWS identifiers have been replaced with masked placeholders (e.g. `vpc-xxxxxxxxxxxx`) so the repo
is safe to share externally or with managers/recruiters.

**Goal:** Provide a professional, copy-pasteable project that demonstrates VPC networking fundamentals and is "consultant-ready".

--

## What I built (summary)
1. Custom VPC (10.0.0.0/16)
2. Public subnet (10.0.1.0/24) — `MapPublicIpOnLaunch=true`
3. Private subnet (10.0.2.0/24) — `MapPublicIpOnLaunch=false`
4. Internet Gateway (IGW) attached to VPC
5. Public route table pointing 0.0.0.0/0 → IGW and associated with public subnet
6. Elastic IP and NAT Gateway (in public subnet) for private subnet outbound access
7. Private route table pointing 0.0.0.0/0 → NAT and associated with private subnet
8. CLI outputs (masked) included under `outputs/` for proof

## Repo contents
- `README.md` (this file)
- `diagrams/aws_vpc_architecture.png` — network diagram (PNG)
- `scripts/` — executable AWS CLI scripts (copy-paste ready). **Replace placeholders before running.**
- `outputs/cli_outputs_masked.txt` — sample verification outputs (masked)
- `LICENSE` — MIT (optional)

## Prerequisites (before running scripts)
- AWS CLI v2 installed and configured (`aws configure`) with a user that has EC2/VPC permissions.
- Run from a machine with AWS CLI and network access.
- **Important:** Replace every `vpc-xxxxxxxxxxxx`, `subnet-xxxxxxxx`, `eipalloc-xxxxxxxx`, `nat-xxxxxxxx` placeholders with your real IDs OR let the scripts capture IDs dynamically.

## How to use (recommended safe flow)
1. Inspect scripts in `scripts/` and update variables at top (if you want specific AZs or names).
2. Make the scripts executable: `chmod +x scripts/*.sh`
3. Run them step-by-step. Example:
   ```bash
   cd scripts
   ./01_create_vpc.sh
   ./02_create_subnets.sh
   ./03_create_igw_and_routes.sh
   ./04_nat_and_private_routes.sh
   ```
4. After each script finishes, check `outputs/cli_outputs_masked.txt` for example `aws` queries to verify resources.

## GitHub push — 1 step at a time (copy-paste)
1. Open terminal and change to the project folder:
   ```bash
   cd /path/to/aws-vpc-project-masked
   ```
2. Initialize local repo (if not already a git repo):
   ```bash
   git init
   git branch -M main
   ```
3. Add remote (choose SSH or HTTPS):
   - SSH example: `git remote add origin git@github.com:YOURUSERNAME/YOUR-REPO.git`
   - HTTPS example: `git remote add origin https://github.com/YOURUSERNAME/YOUR-REPO.git`
4. Add, commit, push:
   ```bash
   git add .
   git commit -m "Initial: AWS VPC lab (masked IDs)"
   git push -u origin main
   ```
5. If GitHub blocks HTTPS password auth, create a Personal Access Token (PAT) and use it as the password when pushing via HTTPS; or switch to SSH keys.

## How to show proof to manager (recommended)
- Share this GitHub repo (masked) publicly or internally.
- If manager needs proof with real IDs, prepare a **private** PDF export of your real CLI outputs and provide it privately (do NOT commit real IDs publicly).

## Notes for reviewers / client (what to look for)
- Clear separation of public/private subnets and correct routing.
- Public subnet must be associated with a route table that routes 0.0.0.0/0 → IGW.
- Private subnet must route 0.0.0.0/0 → NAT Gateway (for outbound Internet access only).
- NAT Gateway must be placed in a public subnet and has an Elastic IP.

## Next steps (advanced)
- Add NACL examples and security group best practices.
- Add Terraform / CloudFormation IaC
- Deploy a demo EC2 in public and private subnets and show connectivity.

---
*Prepared by: Your AWS Lab Mentor — Project files are masked and safe for public sharing.*
