# my-cicd (Terraform + AWS CodePipeline)

This project provisions a complete CI/CD pipeline on AWS using Terraform and AWS Developer Tools. It deploys a simple web application behind an Application Load Balancer (ALB) and automatically runs security checks (SAST and DAST) on every change.

## What This Project Creates

- 1 VPC with public subnets
- 1 Application Load Balancer (ALB)
- 1 Auto Scaling Group with 2 EC2 web servers (serving `hello Liang from CICD!`)
- 1 CodePipeline with the following stages:
  - Source: GitHub repository (`my-cicd`)
  - Build: CodeBuild (SAST + packaging)
  - Test: CodeBuild (DAST)
  - Deploy: CodeDeploy (in-place rolling deployment to the ASG)

## Repository Structure

- `infra/` – Terraform configuration for infrastructure and CI/CD resources
- `app/` – Web application code and CodeDeploy hooks
- `buildspec.yml` – CodeBuild definition for SAST and packaging
- `buildspec_dast.yml` – CodeBuild definition for DAST (OWASP ZAP baseline scan)

## Quick Start

1. Create a GitHub repository named `my-cicd` and push this entire project to it.

2. In the AWS Console, create a CodeStar Connections connection to GitHub and note the resulting `ConnectionArn`.

3. Set the required variables in `infra/terraform.tfvars` (or via CLI):

```hcl
aws_region            = "us-east-1"             # Adjust as needed
github_owner          = "Liang-Ren"            # Your GitHub user or org
github_repo           = "my-cicd"              # This repository name
github_branch         = "main"                 # Branch to trigger the pipeline
github_connection_arn = "arn:aws:codestar-connections:..."  # Your Connection ARN
```

4. From the `infra` directory, initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

5. After the deployment completes, Terraform outputs the ALB DNS name:

- Open `http://<ALB_DNS_NAME>` in your browser. You should see `hello Liang from CICD!`.

6. To test the CI/CD flow, modify `app/index.html` (for example, change the text) and push the change to the `github_branch` you configured:

- CodePipeline will automatically run:
  - CodeBuild SAST (Bandit) and package the app
  - CodeBuild DAST (OWASP ZAP baseline) against the ALB URL
  - CodeDeploy rolling deployment to the EC2 instances in the ASG
- Once the deployment succeeds, the updated text will be visible on the ALB endpoint within a few minutes.
