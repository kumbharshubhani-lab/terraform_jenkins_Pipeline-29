variable "ec2_instances_type"{
default = "t3.micro"
type = string
}

variable "ec2_root_block_device"{
    default = 9
    type = number

}

variable "ec2_ami_id"{
    default = "ami-068c0051b15cdb816"
    type = string
}