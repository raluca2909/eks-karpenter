A) For the first task:

1. Create the S3 bucket for the terraform state file:

(put the aws_account_ID in terraform.tfvars file)

cd statebucket

terraform init

terraform plan 

terraform apply

2. Create the EKS cluster that also uses Karpenter:

(put the aws_account_ID in terraform.tfvars file)

If aws iam list-roles | grep AWSServiceRoleForEC2Spot does not return enything run:

aws iam create-service-linked-role --aws-service-name spot.amazonaws.com

terraform init

terraform plan

terraform apply

aws eks update-kubeconfig --region eu-central-1 --name eks-karpenter-cluster (add the context)

kubectl get pods -A

Check that Karpenter is scaling using the inflate deployment (defined at the end of main.tf file):

kubectl get deployment -A

kubectl scale deployment inflate --replicas 7

kubectl get pods -A

Also check in AWS console EC2 instances and will appear new instance to handle the new pods from the inflate deployment.

B) Second task the research topic:

GPU slicing allows partition a physical GPU into several smaller, isolated instances. It enables running multiple smaller workloads on one GPU, which can lower costs.

Ensure Supported Hardware:

   - GPU instances (e.g., with NVIDIA A100 GPUs) that support MIG (Multi-Instance GPU) mode.

Enable MIG Mode on GPU Nodes:
   - On each GPU node, run the command:  
    
    bash nvidia-smi -mig 1

Deploy the NVIDIA Device Plugin:

   - Install the NVIDIA device plugin as a DaemonSet in EKS cluster.  
   - This plugin will recognize each GPU slice as a separate resource that Kubernetes can schedule.

Update Pod Specifications:

     resources:
       limits:
         nvidia.com/mig-1g.10gb: 1

Enabling GPU Slicing with Karpenter Autoscaler:

    With Karpenter, you must be used a custom AMI (or modify launch template) that automatically enables MIG mode and configures GPU slicing when the node boots up.




