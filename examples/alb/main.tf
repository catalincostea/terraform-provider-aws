# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "ami-5f140c39"

  # The name of our SSH keypair you've created and downloaded
  # from the AWS console.
  #
  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
  #
  key_name = "test"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["sg-c2d5d5ba"]
  subnet_id              = "subnet-49850c3e"
  user_data              = "${file("userdata.sh")}"

  #Instance tags

  tags {
    Name = "elb-example"
  }
}
