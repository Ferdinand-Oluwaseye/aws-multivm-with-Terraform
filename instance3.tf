resource "aws_instance" "default-3-3-3" {
  # ubuntu 18.04
  ami = "ami-0c30afcb7ab02233d"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.default.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  associate_public_ip_address = true
  private_ip = "10.0.0.23"
  key_name = "default-key-pair"
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      host = "${self.public_ip}"
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "echo hi",
      "hostname"
    ]
  }
}

