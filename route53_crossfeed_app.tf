# ------------------------------------------------------------------------------
# Resource records that support Crossfeed site cloudfront endpoints and application.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Prod entries
# ------------------------------------------------------------------------------

# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (ALBs in us-gov-west-1 region)
resource "aws_route53_record" "crossfeed_prod_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_docs_CNAME" {
  provider = aws.route53resourcechange

  name    = "docs.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["cisagov.github.io"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Prod API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_prod_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_api_acm_CNAME" {
  provider = aws.route53resourcechange

  name    = "_972ea3f08cb5c1e588ee885ef10d0f9e.api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_829d98e4bbf4eeaae36108a98a720ce2.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Prod SES entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_prod_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "dzboeznslvck5kqcgnfgrnmg62rig7t2._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["dzboeznslvck5kqcgnfgrnmg62rig7t2.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "6wpqhy2h6hmcp6dlkvidqucgvmohc65u._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["6wpqhy2h6hmcp6dlkvidqucgvmohc65u.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "lcifzdqqdwmyuewt2wrhgecmvsiakiqi._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["lcifzdqqdwmyuewt2wrhgecmvsiakiqi.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_cd_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "ljgrfkavt7.execute-api.us-east-1.amazonaws.com."
    zone_id                = var.api_gateway_east_1_zone_id
    evaluate_target_health = false
  }
  name    = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "ljgrfkavt7.execute-api.us-east-1.amazonaws.com."
    zone_id                = var.api_gateway_east_1_zone_id
    evaluate_target_health = false
  }
  name    = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (ALBs in us-gov-west-1 region)
resource "aws_route53_record" "crossfeed_staging_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_CNAME" {
  provider = aws.route53resourcechange

  name    = "_db90da37016cd8f582b6564b096e4e53.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_6c1474364c21c38f12ef460de25ce579.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_CNAME" {
  provider = aws.route53resourcechange

  name    = "_778113d42c9d50544ff24081c8690e7b.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_be6c148419746ed67c9439603507824f.zcdnftlygx.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_MX" {
  provider = aws.route53resourcechange

  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_TXT" {
  provider = aws.route53resourcechange

  name = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "amazonses:rv6QdeDe1r8/Hn5HkSmfO8FttR8A8/2pHXtsLEHQI34=",
    "amazonses:8YPbpAkOE6Z1kvYhSuV2W8KG0To0SjQrP6nm/xpilR0=", # COOL
    "v=spf1 include:amazonses.com -all",
  ]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "x4OZIl79RabndS-x_tcbgJhg0_LpWu6nk-w0RR5j4PY",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_cd_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "mkrl99gnu9.execute-api.us-east-1.amazonaws.com."
    zone_id                = var.api_gateway_edge_zone_id
    evaluate_target_health = false
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "mkrl99gnu9.execute-api.us-east-1.amazonaws.com."
    zone_id                = var.api_gateway_edge_zone_id
    evaluate_target_health = false
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (ALBs in us-gov-west-1 region)
resource "aws_route53_record" "crossfeed_staging_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_CNAME" {
  provider = aws.route53resourcechange

  name    = "_1cd918a94c59cbd2fdce9df0fdfc980f.api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_f1fe0d0997fac6b9d221c8b482ac0ec2.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}


resource "aws_route53_record" "crossfeed_staging_cd_api_CNAME" {
  provider = aws.route53resourcechange

  name    = "_75f0c44adb3c8ec0023ddc11585227e8.api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_c4ade117ce7d85d8765dc1e8925140df.zcdnftlygx.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "R4n3EyR5INrjhD7aoq26AVCM1VOwNUfEd9CrIU9AoCs",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging SES entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "xeabzav4tgtboc5wwbhu2bx25buatdfi._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["xeabzav4tgtboc5wwbhu2bx25buatdfi.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "rnscye3ptl2izjxivoefxcrs3xsja2sr._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rnscye3ptl2izjxivoefxcrs3xsja2sr.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "t4n7gyy6rlyzgjfayzgmyq4heevjmq4n._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["t4n7gyy6rlyzgjfayzgmyq4heevjmq4n.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "7mu6wejrss5bnby2d4jnnrznr7fk6py6._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["7mu6wejrss5bnby2d4jnnrznr7fk6py6.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "leycxxpxpvcxgli34u7a3mmvcdgojqdf._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["leycxxpxpvcxgli34u7a3mmvcdgojqdf.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "zhnkkpsqkxlh6xdjhvs4uluderyicadh._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["zhnkkpsqkxlh6xdjhvs4uluderyicadh.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
