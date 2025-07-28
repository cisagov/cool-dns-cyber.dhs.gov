# ------------------------------------------------------------------------------
# Resource records that support Crossfeed site cloudfront endpoints and application.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Prod entries
# ------------------------------------------------------------------------------

# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (ALBs in us-gov-west-1 region)
# A‑record alias for cyber‑hygeine.cisa.dhs.gov → your ALB
resource "aws_route53_record" "cyber_hygiene_prod_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed‑prod‑1638162291.us‑gov‑west‑1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "cyber‑hygeine.${aws_route53_zone.cisa_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cisa_dhs_gov.zone_id
}

# AAAA‑record alias for IPv6
resource "aws_route53_record" "cyber_hygiene_prod_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed‑prod‑1638162291.us‑gov‑west‑1.elb.amazonaws.com."
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
  name    = "cyber‑hygeine.${aws_route53_zone.cisa_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cisa_dhs_gov.zone_id
}

#CNAME so crossfeed.cyber.dhs.gov → cyber‑hygiene.cisa.dhs.gov
resource "aws_route53_record" "crossfeed_prod_CNAME" {
  provider = aws.route53resourcechange

  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "CNAME"
  ttl     = 300

  records = [
    "cyber‑hygiene.cisa.dhs.gov.",
  ]
}

resource "aws_route53_record" "crossfeed_prod_docs_CNAME" {
  provider = aws.route53resourcechange

  name    = "docs.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["cisagov.github.io"]
  ttl     = 300
  type    = "CNAME"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "ct0l3YNdaIble-FQ0CgaGrurEcZAVPn6OrphYnXmcRM",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "ready_set_cyber_prod_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.readysetcyber.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "lBVDy-eRJNPE2kLsri9_ED6_Ds5Dthq4QtUMIsJmZ3g",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Prod API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_prod_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
  }
  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-prod-1638162291.us-gov-west-1.elb.amazonaws.com."
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
  }
  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_prod_digicert_CAA" {
  provider = aws.route53resourcechange

  name    = "crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["0 issue \"digicert.com\""]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "api_crossfeed_prod_digicert_CAA" {
  provider = aws.route53resourcechange

  name    = "api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["0 issue \"digicert.com\""]
  ttl     = 3600
  type    = "CAA"
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

resource "aws_route53_record" "crossfeed_prod_api_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.api.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "W0TCCWlQGWMiEncVtPUCihlNj0oj-6BcEPzOSwAjbY8",
  ]
  ttl     = 3000
  type    = "TXT"
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
    name                   = "d-6duqftvveb.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-6duqftvveb.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
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
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
  }
  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
  }
  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_digicert_CAA" {
  provider = aws.route53resourcechange

  name    = "staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["0 issue \"digicert.com\""]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "api_crossfeed_staging_digicert_CAA" {
  provider = aws.route53resourcechange

  name    = "api.crossfeed.staging.${aws_route53_zone.cyber_dhs_gov.name}"
  records = ["0 issue \"digicert.com\""]
  ttl     = 3600
  type    = "CAA"
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
    "AjujZpKd_IdUxJKOiczsDCCsUoUicAkTeVL52cXiVWc",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Integration entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_integration_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-sl8v3ffkci.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}


resource "aws_route53_record" "crossfeed_integration_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-sl8v3ffkci.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_integration_digicert_letsencrypt_CAA" {
  provider = aws.route53resourcechange

  name = "integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "0 issue \"digicert.com\"",
    "0 issue \"letsencrypt.org\"",
  ]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_integration_acme_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "j0VBe_uiJnGXevUx5bjypNetTrG1eoeB7bnsY1JuKY8",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Integration API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_integration_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-3kn94fjcb8.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "api.integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_integration_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-3kn94fjcb8.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "api.integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_integration_api_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.api.integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "dVG-uxp-WN4blWmBgUpE8CDb7ZEBB93eeQKifIt33oQ",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_integration_api_digicert_letsencrypt_CAA" {
  provider = aws.route53resourcechange

  name = "api.integration.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "0 issue \"digicert.com\"",
    "0 issue \"letsencrypt.org\"",
  ]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# ------------------------------------------------------------------------------
# Staging API entries
# ------------------------------------------------------------------------------

resource "aws_route53_record" "crossfeed_staging_cd_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-y5130perp8.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "d-y5130perp8.execute-api.us-east-1.amazonaws.com."
    evaluate_target_health = false
    zone_id                = var.api_gateway_zone_id
  }
  name    = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "AAAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_api_staging_cd_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "cT0KQCAL1VHuTAXx-SBc_5UN-Eml1CNMTRk2VuJSKHk",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "api_crossfeed_staging_digicert_letsencrypt_CAA" {
  provider = aws.route53resourcechange

  name = "api.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "0 issue \"digicert.com\"",
    "0 issue \"letsencrypt.org\"",
  ]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_cd_TXT" {
  provider = aws.route53resourcechange

  name = "_acme-challenge.staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "jEboFAY5GZmMzCUhwVtr_SIzubU9Um3yRFioNeyeP5Q",
  ]
  ttl     = 3000
  type    = "TXT"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_digicert_letsencrypt_CAA" {
  provider = aws.route53resourcechange

  name = "staging-cd.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  records = [
    "0 issue \"digicert.com\"",
    "0 issue \"letsencrypt.org\"",
  ]
  ttl     = 3600
  type    = "CAA"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

# The hosted_zone_id for the below records comes from https://docs.aws.amazon.com/general/latest/gr/elb.html
# (ALBs in us-gov-west-1 region)
resource "aws_route53_record" "crossfeed_staging_api_A" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
  }
  name    = "api.staging.crossfeed.${aws_route53_zone.cyber_dhs_gov.name}"
  type    = "A"
  zone_id = aws_route53_zone.cyber_dhs_gov.zone_id
}

resource "aws_route53_record" "crossfeed_staging_api_AAAA" {
  provider = aws.route53resourcechange

  alias {
    name                   = "crossfeed-stage-1792947306.us-gov-west-1.elb.amazonaws.com."
    evaluate_target_health = false
    zone_id                = "Z33AYJ8TM3BH4J"
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
    "Ex05wBdGQeoEu8kuI2zmTwz4tQx-7ShKYBnL-IbNy4A",
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
