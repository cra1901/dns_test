locals{
    dns_txt = "v=spf1 include:spf.protection.outlook.com include:emaileuc.freshservice.com \"\"include:spf-0055bf01.pphosted.com include:_spf.salesforce.com include:mg-spf.greenhouse.io include:aspmx.pardot.com ip4:52.214.50.118/32 ip4:52.215.241.173/32 ip4:52.215.241.174/32 -all"
}

data "aws_route53_zone" "cain-backup_zone"{
    provider = aws.aws_prod
    name    = "cain-backup.xyz"
}

resource "aws_route53_record" "cain-backup_txt"{
    provider = aws.aws_prod
    name    = "cain-backup.xyz"
    zone_id = data.aws_route53_zone.cain-backup_zone.zone_id
    type    = "TXT"
    ttl     = "900"

records = [
    local.dns_txt
]
} 

