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

  name    = "_fb2df3ea0959566abf846bdb73696d75.api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_8ef30eecb0785429151594c13c049761.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_TXT" {
  provider = aws.route53resourcechange

  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["amazonses:rkxSP4d4VmzpdVhKoONkBFT8XYa/vJrCHgs5rs25/L4="]
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

  name    = "_amazonses.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rkxSP4d4VmzpdVhKoONkBFT8XYa/vJrCHgs5rs25/L4="]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "do8d5i2re25cf.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "do8d5i2re25cf.cloudfront.net."
    zone_id                = var.cloudfront_zone_id
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

  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["amazonses:rv6QdeDe1r8/Hn5HkSmfO8FttR8A8/2pHXtsLEHQI34="]
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
  name    = "api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
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
  name    = "api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_CNAME1" {
  provider = aws.route53resourcechange

  name    = "_1cd918a94c59cbd2fdce9df0fdfc980f.api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_f1fe0d0997fac6b9d221c8b482ac0ec2.jfrzftwwjs.acm-validations.aws."]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_CNAME2" {
  provider = aws.route53resourcechange

  name    = "_95c4bc30d3e15e6b58dc96250e3661a4.api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["_73aacddb56ac20ef77492c962bf006d8.jfrzftwwjs.acm-validations.aws"]
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

resource "aws_route53_record" "crossfeed_staging_ses_TXT" {
  provider = aws.route53resourcechange

  name    = "_amazonses.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["rv6QdeDe1r8/Hn5HkSmfO8FttR8A8/2pHXtsLEHQI34="]
  ttl     = 300
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}
