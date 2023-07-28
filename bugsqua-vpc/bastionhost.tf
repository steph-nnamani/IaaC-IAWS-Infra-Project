## EC2 Bastion Host
resource "aws_instance" "ec2-bastion-host" {
  ami                         = "ami-0f34c5ae932e6f0e4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.bugsquasherkey.key_name
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data                   = "${file("bastion.sh")}"
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
    volume_type           = "gp2"
    encrypted             = true
    tags = {
      Name = "bastion root block dev"
      #PROJECT = "ArgoCD"
    }
  }  

  tags_all = {
    Name = "bugsquashers bastion host" 
    PROJECT = "ArgoCD" 
  }
  #CPU Credits are specific to burstable instances and allow them to handle temporary 
  #spikes in CPU utilization without incurring additional charges.
  credit_specification {
    cpu_credits = "standard"
  }
  /*tags = {
    Name = "${var.project}-ec2-bastion-host-${var.environment}"
  }
  */
  lifecycle {
    ignore_changes = [
      associate_public_ip_address,
    ]
  }
  depends_on = [
    aws_instance.jenkins_server
  ]
}

