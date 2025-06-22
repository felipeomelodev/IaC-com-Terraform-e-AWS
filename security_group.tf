resource "aws_security_group" "http_sg" {
    name        = "allow-http-sg"
    description = "Allow HTTP inbound traffic"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow-http"
    }
}

resource "aws_security_group" "ssh_sg" {
    name        = "allow-ssh-sg"
    description = "Allow SSH inbound traffic from a specific IP"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.meu_ip_publico]
    }

    tags = {
        Name = "allow-ssh"
    }
}

resource "aws_security_group" "egress_all_sg" {
    name        = "allow-all-egress-sg"
    description = "Allow all outbound traffic"

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow-all-egress"
    }
}
