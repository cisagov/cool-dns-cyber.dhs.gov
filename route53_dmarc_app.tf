# ------------------------------------------------------------------------------
# Resource records that support the DMARC application.
# ------------------------------------------------------------------------------

resource "aws_route53_record" "dmarc_MX" {
  provider = aws.route53resourcechange

  name    = "dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 1800
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "_amazonses_dmarc_TXT" {
  provider = aws.route53resourcechange

  name    = "_amazonses.dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["CV4Ex6gYlJutTAnA8xkQa0hk3toSRuFvmibJ0sRiAWw="]
  ttl     = 60
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "wildcard_report_dmarc_TXT" {
  provider = aws.route53resourcechange

  name    = "*._report._dmarc.dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["v=DMARC1"]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "dkim1_dmarc_CNAME" {
  provider = aws.route53resourcechange

  name    = "6na6lcj7onl5bco4ytfj4ud7p6t7kvtp._domainkey.dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["6na6lcj7onl5bco4ytfj4ud7p6t7kvtp.dkim.amazonses.com"]
  ttl     = 1800
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "dkim2_dmarc_CNAME" {
  provider = aws.route53resourcechange

  name    = "nsbndtrubsyckjqnb4wkv6xdkrqe3dk5._domainkey.dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["nsbndtrubsyckjqnb4wkv6xdkrqe3dk5.dkim.amazonses.com"]
  ttl     = 1800
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "dkim3_dmarc_CNAME" {
  provider = aws.route53resourcechange

  name    = "yhfkaco3ukhtbowt2bdvfz5czwuofitm._domainkey.dmarc.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["yhfkaco3ukhtbowt2bdvfz5czwuofitm.dkim.amazonses.com"]
  ttl     = 1800
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
