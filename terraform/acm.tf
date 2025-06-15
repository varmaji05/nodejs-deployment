# Request certificate
resource "aws_acm_certificate" "ssl_cert" {
  domain_name       = "demo-assignment.com"
  validation_method = "DNS"

  tags = {
    Name = "${var.project}-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_zone" "main" {
  name = "example.com"
}

# Fetch validation options (needed to create DNS records)
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_cert.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.value]
}

# Validate certificate after DNS record is in place
resource "aws_acm_certificate_validation" "ssl_cert_validation" {
  certificate_arn         = aws_acm_certificate.ssl_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
