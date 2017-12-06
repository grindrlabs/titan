# TITAN Network Module - Security Group Resources

# Security Group Allowing Network-Internal SSH Access
resource "aws_security_group" "ssh" {
  name = "titan_${var.name_short}_ssh_internal"
  description = "Network-Internal SSH Access in the ${var.name_fancy}."
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "titan_${var.name_short}_ssh_internal"
    # atlas variables
    titan_network = "${var.name}"
    titan_zone    = "${var.zone}"
  }
}
