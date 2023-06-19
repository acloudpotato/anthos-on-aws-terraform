# anthos-on-aws-terraform - WIP Document

## High level Architecture
Image

## Prerequisites -

- AWS Admin user's access & secret to run terraform script

## Setting up the AWS credentials in the terminal 
```
export AWS_ACCESS_KEY=<YOUR AWS ACCESS KEY>
export AWS_SECRET_KEY=<YOUR AWS SECRET KEY>
```

## Copy the repo to your local 
```
git clone https://github.com/abhishek7389/anthos-on-aws-terraform.git
```

## Understand folder structure
```
anthos-on-aws-terraform
├── gke-on-aws
│   ├── Anthos-on-AWS-architecture.png
│   ├── backend.tf
│   ├── cloud-console-reader.yaml
│   ├── data.tf
│   ├── LICENSES.txt
│   ├── locals.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── README.md
│   ├── terraform.tfvars.sample
│   └── variables.tf
├── vpc
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfvars.sample
│   └── variables.tf
└── modules
    ├── ebs_csi_driver_controller
    │   ├── controller.tf
    │   ├── csi_driver.tf
    │   ├── csi_rbac.tf
    │   ├── iam.tf
    │   ├── locals.tf
    │   ├── node-rbac.tf
    │   ├── node.tf
    │   ├── outputs.tf
    │   ├── README.md
    │   ├── variables.tf
    │   └── versions.tf
    ├── fleet_registration
    │   ├── main.tf
    │   └── variables.tf
    ├── gke_on_aws
    │   ├── anthos-cluster
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   ├── variables.tf
    │   │   └── versions.tf
    │   ├── gcp-data
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   └── node-pool
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    └── networking
        └── vpc
            ├── main.tf
            ├── output.tf
            ├── variables.tf
            └── versions.tf

```
## Changing directory to the editable folder
```
cd anthos-on-aws-terraform/vpc
```


## Editable section

- backend.tf file - Definition of your terraform code backend, where all the statefiles gonna save

sample  image


- terraform.tfvars.sample - Definition of values of each variable present in the terraform code,before apply make sure rename the file to terraform.tfvars 

sample  image

## Applying the configuration

1 Download the required modules
```
terraform init
```

2. Validate the deployments
```
terraform plan
```
3. Deploy the ASM to our existing cluster
```
terraform apply
```

## Changing directory to the editable folder for anthos clusters on AWS
```
cd ../gke-on-aws
```
## Editable section

- backend.tf file - Definition of your terraform code backend, where all the statefiles gonna save

sample  image


- data.tf file - Definition of your previously created cluster information.

sample  image


- terraform.tfvars.sample - Definition of values of each variable present in the terraform code,before apply make sure rename the file to terraform.tfvars 

sample  image

## Applying the configuration

1 Download the required modules
```
terraform init
```

2. Validate the deployments
```
terraform plan
```
3. Deploy the ASM to our existing cluster
```
terraform apply
```
## Anthos on AWS Architecture
Image

### For full video demostration & blog follow the link.