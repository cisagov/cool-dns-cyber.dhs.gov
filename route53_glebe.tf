resource "aws_route53_record" "drop_ncats_A" {
  provider = aws.resource_change_role

  name    = "drop.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["64.69.57.40"]
  ttl     = 60
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "fw01_ncats_A" {
  provider = aws.resource_change_role

  name    = "fw01.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["64.69.57.3"]
  ttl     = 300
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "fw02_ncats_A" {
  provider = aws.resource_change_role

  name    = "fw02.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["64.69.57.4"]
  ttl     = 300
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "vip_ncats_A" {
  provider = aws.resource_change_role

  name    = "vip.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["64.69.57.2"]
  ttl     = 300
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "vpn_ncats_CNAME" {
  provider = aws.resource_change_role

  name    = "vpn.ncats.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["vip.ncats.cyber.dhs.gov"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
