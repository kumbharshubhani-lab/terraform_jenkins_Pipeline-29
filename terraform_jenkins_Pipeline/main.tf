resource "aws_instance" "jenkins_ec2" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t3.micro"
    
    tags = {
      Name = "Terraform-jenkins-Ec2"
    }
}