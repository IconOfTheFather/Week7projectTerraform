# create ec2
resource "aws_instance" "server1" {
    instance_type = "t2.micro"
    ami = "ami-0195204d5dce06d99"
    key_name = aws_key_pair.key.key_name
    security_groups = [ aws_security_group.sg.name ]
    user_data = file("userdata.sh")  
    tags = {
      Name = "utc-dev"
      Team = "Cloud Transformation"
      Environment = "Dev"
      Created-by = "Mykel"
    }
}
#create ebs volume
resource "aws_ebs_volume" "vol1" {
  availability_zone = aws_instance.server1.availability_zone
  size = 10
  tags = {
    Name = "devvolume"
    Team = "cloud"
  }
}
#attach volume
resource "aws_volume_attachment" "name" {
    device_name = "/dev/sdb"
    volume_id = aws_ebs_volume.vol1.id
    instance_id = aws_instance.server1.id
}