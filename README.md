# anthos-on-aws-terraform

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

![image](https://user-images.githubusercontent.com/52596897/184918953-0a1d1268-5f61-404f-b8cf-74ae84465930.png)


- terraform.tfvars.sample - Definition of values of each variable present in the terraform code,before apply make sure rename the file to terraform.tfvars 

![image](https://user-images.githubusercontent.com/52596897/184919182-15f3b842-84f7-49ff-ade1-65063bca08a2.png)

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

![image](https://user-images.githubusercontent.com/52596897/184918953-0a1d1268-5f61-404f-b8cf-74ae84465930.png)


- data-source.tf file - Definition of your previously created cluster information.

![image](https://user-images.githubusercontent.com/52596897/184919089-e37f4648-2ef0-46b6-a5dc-fc8acb0a38ec.png)


- terraform.tfvars.sample - Definition of values of each variable present in the terraform code,before apply make sure rename the file to terraform.tfvars 

![image](https://user-images.githubusercontent.com/52596897/184919182-15f3b842-84f7-49ff-ade1-65063bca08a2.png)

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