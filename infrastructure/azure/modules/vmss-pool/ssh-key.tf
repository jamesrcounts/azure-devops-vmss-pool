resource "tls_private_key" "admin" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}