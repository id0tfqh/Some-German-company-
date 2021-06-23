provider "aws" {
  region  = "${var.region}"
  profile = "Some Germany company"
}

/* Install latest image Amazon Linux*/
data "aws_ami" "latest" {
    owners = ["137112412989"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
    }
}

/* EC2 description */
resource "aws_instance" "something-application" {

  ami                         = "${data.aws_ami.latest.id}"
  instance_type               = "${var.instanceType}"
  key_name                    = "${var.sshKeyName}"
  monitoring                  = "true"
  associate_public_ip_address = "true"
  availability_zone           = "${var.aZone}"
  subnet_id                   = "${aws_subnet.sgc-subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.target.id}",
    "${aws_security_group.control.id}",
    "${aws_security_group.public.id}"]
  count                       = "${var.instanceCount}"
  user_data                   = file("bootstrap.sh")
  
  root_block_device {
   volume_size            = "${var.volumeSize}"
    volume_type           = "gp3"
    encrypted             = "false"
    delete_on_termination = "true"
  }

  tags = {
    Name = "something"
    Project = "Super project"
  }
}
