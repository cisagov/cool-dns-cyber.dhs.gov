# ------------------------------------------------------------------------------
# Resource records that support Crossfeed site cloudfront endpoints and application.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Prod entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_prod_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d2urclllpa4h1x.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d2urclllpa4h1x.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_acm_CNAME" {
  provider = aws.route53resourcechange

  name    = "_fb2df3ea0959566abf846bdb73696d75.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_8ef30eecb0785429151594c13c049761.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
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

resource "aws_route53_record" "crossfeed_prod_TXT" {
  provider = aws.route53resourcechange

  name = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "amazonses:rkxSP4d4VmzpdVhKoONkBFT8XYa/vJrCHgs5rs25/L4=",
    "amazonses:UNxjvhzeNYcUJ9Bzs+vzfTC+KL+h8KgCrfWekL7vI9U=", # COOL
    "v=spf1 include:amazonses.com -all",
  ]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Prod API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_prod_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d1iatsjalsmsuw.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d1iatsjalsmsuw.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
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

  name    = "sw4dnn5djga24lcqm2p4hgzbr6bvtpiq._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["sw4dnn5djga24lcqm2p4hgzbr6bvtpiq.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "vy6vyzrznjhmlkisuikprv7b7tx7qvz3._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["vy6vyzrznjhmlkisuikprv7b7tx7qvz3.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "yhp7dyah7kpdgu22qskm7hqhyddoeu5z._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["yhp7dyah7kpdgu22qskm7hqhyddoeu5z.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_prod_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "5lhql4ooyzt66oy5u7ccywig34mmr3hw._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["5lhql4ooyzt66oy5u7ccywig34mmr3hw.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_prod_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "ligwjn4oa5gctkotd6vz55jfvdu3bp46._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["ligwjn4oa5gctkotd6vz55jfvdu3bp46.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_prod_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "qbuoawykv5o3tyzxzlctewoqccgr4l27._domainkey.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["qbuoawykv5o3tyzxzlctewoqccgr4l27.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_MX" {
  provider = aws.route53resourcechange

  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["10 inbound-smtp.us-east-1.amazonaws.com"]
  ttl     = 300
  type    = "MX"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_ses_TXT" {
  provider = aws.route53resourcechange

  name = "_amazonses.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "rkxSP4d4VmzpdVhKoONkBFT8XYa/vJrCHgs5rs25/L4=",
    "UNxjvhzeNYcUJ9Bzs+vzfTC+KL+h8KgCrfWekL7vI9U=", # COOL
  ]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_cd_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "do8d5i2re25cf.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "do8d5i2re25cf.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}


# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (NLBs in us-gov-west-1 region)
resource "aws_route53_record" "crossfeed_staging_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "ZMG1MZ2THAWF1"
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    zone_id                = "ZMG1MZ2THAWF1"
    evaluate_target_health = false
  }
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_CNAME1" {
  provider = aws.route53resourcechange

  name    = "_db90da37016cd8f582b6564b096e4e53.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_6c1474364c21c38f12ef460de25ce579.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_CNAME2" {
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

# ------------------------------------------------------------------------------
# Staging API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d2n7pvqicqw5zg.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d2n7pvqicqw5zg.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
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


resource "aws_route53_record" "crossfeed_staging_api_CNAME2" {
  provider = aws.route53resourcechange

  name    = "_75f0c44adb3c8ec0023ddc11585227e8.api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_c4ade117ce7d85d8765dc1e8925140df.zcdnftlygx.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_CNAME3" {
  provider = aws.route53resourcechange

  name    = "staging.api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging SES entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "7mu6wejrss5bnby2d4jnnrznr7fk6py6._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["7mu6wejrss5bnby2d4jnnrznr7fk6py6.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "leycxxpxpvcxgli34u7a3mmvcdgojqdf._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["leycxxpxpvcxgli34u7a3mmvcdgojqdf.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "zhnkkpsqkxlh6xdjhvs4uluderyicadh._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["zhnkkpsqkxlh6xdjhvs4uluderyicadh.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_staging_dkim1_CNAME" {
  provider = aws.route53resourcechange

  name    = "fndugqqyzkqvcw6esqcajm4kplwsj4cl._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["fndugqqyzkqvcw6esqcajm4kplwsj4cl.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_staging_dkim2_CNAME" {
  provider = aws.route53resourcechange

  name    = "ajkrqvc47hndkou3ynietdzkybpvrvdn._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["ajkrqvc47hndkou3ynietdzkybpvrvdn.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_cool_staging_dkim3_CNAME" {
  provider = aws.route53resourcechange

  name    = "ocfzdkfrvb2sop6mbqhrxmkmzqgnnhux._domainkey.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["ocfzdkfrvb2sop6mbqhrxmkmzqgnnhux.dkim.amazonses.com"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_ses_TXT" {
  provider = aws.route53resourcechange

  name = "_amazonses.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "rv6QdeDe1r8/Hn5HkSmfO8FttR8A8/2pHXtsLEHQI34=",
    "8YPbpAkOE6Z1kvYhSuV2W8KG0To0SjQrP6nm/xpilR0=", # COOL
  ]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
