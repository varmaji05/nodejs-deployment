resource "aws_acm_certificate" "ssl_cert" {
  domain_name       = "demo-assignment.com"
  validation_method = "DNS"

  tags = {
    Name = "${var.project}-cert"
  }
}

resource "aws_acm_certificate_validation" "ssl_cert_validation" {
  certificate_arn         = aws_acm_certificate.ssl_cert.arn
}
