resource "aws_key_pair" "j_iac_key" {
  key_name = "j_iac_id_rsa"
    public_key = file(var.path_to_public_key)
}