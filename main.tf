module "dev-app"{
    source = "./modules"
    my-env = "dev"
    instance_type = "t2.micro"
    ami_id = "ami-0ea3c35c5c3284d82"
}

module "stg-app"{
    source = "./modules"
    my-env = "stg"
    instance_type = "t2.micro"
    ami_id = "ami-0ea3c35c5c3284d82"
}

module "prd-app"{
    source = "./modules"
    my-env = "prd"
    instance_type = "t2.micro"
    ami_id = "ami-0ea3c35c5c3284d82"
}