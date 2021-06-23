/* Security group description */
resource "aws_security_group" "target" {
  name = "target-access"
  description = "Allow HTTP inbound traffic"
  vpc_id = "${aws_vpc.sgc-vpc.id}"
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

resource "aws_security_group" "control" {
  name = "ssh-access"
  description = "Allow SSH inbound traffic"
  vpc_id = "${aws_vpc.sgc-vpc.id}"
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

resource "aws_security_group" "public" {
  name = "outgoing-traffic"
  description = "Allow all outbound traffic"
  vpc_id = "${aws_vpc.sgc-vpc.id}"
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

/* Security group rule description */
resource "aws_security_group_rule" "http" {
    description = "Allow HTTP inbound traffic"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.target.id}"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh" {
    description = "Allow SSH inbound traffic"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_group_id = "${aws_security_group.control.id}"
    cidr_blocks = ["${var.mainIP}"]
}

resource "aws_security_group_rule" "allow-outbound-all" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    security_group_id = "${aws_security_group.public.id}"
    cidr_blocks = ["0.0.0.0/0"]
}
