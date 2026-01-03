output "ec2_public_ip"{
    value = aws_instance.My_shubh_instances.public_ip
}

output "ec2_public_dns"{
    value = aws_instance.My_shubh_instances.public_dns
}
output "ec2_private_ip"{
    value = aws_instance.My_shubh_instances.private_ip
}