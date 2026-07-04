# ☸️ Amazon EKS Infrastructure with Terraform

> Provision a production-ready Amazon EKS (Elastic Kubernetes Service) cluster using Terraform modules and AWS best practices.

<p align="center">

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge\&logo=terraform)
![Amazon EKS](https://img.shields.io/badge/Amazon-EKS-FF9900?style=for-the-badge\&logo=amazonaws)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge\&logo=kubernetes)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge\&logo=amazonaws)

</p>

---

# 📖 Overview

This project provisions a complete **Amazon EKS cluster** using Terraform community modules.

The infrastructure includes a custom VPC, managed node groups, Kubernetes networking add-ons, and production-ready networking components required to run containerized workloads on AWS.

The project follows Infrastructure as Code (IaC) principles, making the infrastructure reproducible, scalable, and version-controlled. It aligns with Terraform module organization and AWS recommendations for reusable infrastructure.

---

# 🏗️ Architecture

```text
                         Terraform
                             │
                    terraform apply
                             │
                             ▼
                 ┌─────────────────────┐
                 │ Terraform Modules   │
                 └──────────┬──────────┘
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
          ▼                                   ▼
     VPC Module                         EKS Module
          │                                   │
          ▼                                   ▼
 ┌──────────────────┐             ┌────────────────────┐
 │ Custom VPC       │             │ EKS Control Plane  │
 │ Public Subnets   │             └─────────┬──────────┘
 │ Private Subnets  │                       │
 │ Intra Subnets    │                       ▼
 └────────┬─────────┘             Managed Node Group
          │                                │
          ▼                                ▼
      NAT Gateway                    EC2 Worker Nodes
                                             │
                                             ▼
                                      Kubernetes Pods
```

---

# ⚙️ Infrastructure Components

* Amazon EKS Cluster
* Managed Node Groups
* Custom Amazon VPC
* Public, Private & Intra Subnets
* NAT Gateway
* Internet Gateway
* Route Tables
* EKS Add-ons

  * VPC CNI
  * CoreDNS
  * kube-proxy
* IAM Roles
* Security Groups

---

# 🚀 Terraform Workflow

```text
Write Terraform Code
          │
          ▼
terraform init
          │
          ▼
terraform validate
          │
          ▼
terraform plan
          │
          ▼
terraform apply
          │
          ▼
AWS Infrastructure Created
          │
          ▼
aws eks update-kubeconfig
          │
          ▼
kubectl get nodes
          │
          ▼
Deploy Applications
```

---

# ☸️ Kubernetes Flow

```text
Developer
    │
kubectl apply
    │
    ▼
Amazon EKS Control Plane
    │
Schedules Pods
    ▼
Managed Node Group
    │
EC2 Instances
    │
Runs Containers
```

---

# 📂 Project Structure

```text
.
├── provider.tf
├── versions.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── locals.tf
└── README.md
```

---

# 🛠️ Technologies Used

* Terraform
* Amazon EKS
* Amazon VPC
* Amazon EC2
* IAM
* Kubernetes
* kubectl
* AWS CLI

---

# 🚀 Getting Started

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Infrastructure

```bash
terraform plan
```

### Create Infrastructure

```bash
terraform apply
```

### Configure kubectl

```bash
aws eks update-kubeconfig \
--region us-east-2 \
--name <cluster-name>
```

### Verify Cluster

```bash
kubectl get nodes
kubectl get pods -A
```

---

# 📚 Concepts Covered

* Infrastructure as Code (IaC)
* Terraform Modules
* Amazon EKS
* Custom VPC Networking
* Managed Node Groups
* Kubernetes Networking
* Cluster Add-ons
* IAM Roles
* Security Groups
* NAT Gateway
* Multi-AZ Deployment

---

# 🎯 Learning Outcomes

This project helped me understand:

* Building Kubernetes infrastructure using Terraform.
* Provisioning Amazon EKS with reusable Terraform modules.
* Designing VPC networking for Kubernetes.
* Managing worker nodes using EKS Managed Node Groups.
* Configuring Kubernetes add-ons such as CoreDNS, VPC CNI, and kube-proxy.
* Connecting Terraform, AWS CLI, and kubectl to manage an EKS cluster.

---

# 🔮 Future Improvements

* Deploy sample applications
* Helm Charts
* NGINX Ingress Controller
* AWS Load Balancer Controller
* Horizontal Pod Autoscaler (HPA)
* Prometheus & Grafana
* ArgoCD (GitOps)
* GitHub Actions CI/CD
* Amazon ECR Integration

---

# 👨‍💻 Author

**Arpit Prajapati**

GitHub: https://github.com/ARPITPRAJAPATI

---

# ⭐ Support

If you found this project helpful, consider giving it a ⭐.
