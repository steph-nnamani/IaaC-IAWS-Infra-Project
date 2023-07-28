## EC2 Bastion Host Elastic IP
resource "aws_eip" "ec2-bastion-host-eip" {
  instance   = aws_instance.ec2-bastion-host.id
  #domain = "vcp"
  tags = {
    Name = "bastion Host Elastic IP"
  }
}
/*
## EC2 Bastion Host Elastic IP Association
resource "aws_eip_association" "ec2-bastion-host-eip-association" {
  instance_id   = aws_instance.ec2-bastion-host.id
  allocation_id = aws_eip.ec2-bastion-host-eip.id
}
*/