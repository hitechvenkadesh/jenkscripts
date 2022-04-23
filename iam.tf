variable "acc_no" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_access_key" {
  type = string
}

provider "aws" {
  region = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
  }

resource "aws_iam_user" "sowmi"{
    name = "sowmi"
	}
resource "aws_iam_user" "subha"{
    name = "subha"
	}
resource "aws_iam_user" "saran"{
    name = "saran"
	}
resource "aws_iam_group" "cse"{
    name = "cse"
	}
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.sowmi.name,
    aws_iam_user.subha.name,
	aws_iam_user.saran.name
	
  ]

  group = aws_iam_group.cse.name
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.cse.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
