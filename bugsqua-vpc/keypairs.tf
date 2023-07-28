resource "aws_key_pair" "bugsquasherkey" {
  key_name   = "bugsquasherkey"
  public_key = file(var.PUB_KEY_PATH) #var.PUB_KEY_PATH refers to bugsquasherskey.pub in our var file

  tags = {
    Name = "var.Name_tag"
  }
}
