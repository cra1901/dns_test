locals{
    dns_txt = "v=spf1 include:spf.protection.outlook.com include:spf.protection.outlook.co.uk -all"
}

data "aws_route53_zone" "cain-backup_zone"{
    provider = aws.aws_prod
    name    = "cain-backup.xyz"
}

data "aws_route53_record" "cain-backup_txt"{
    provider = aws.aws_prod
    name    = "cain-backup.xyz"
    zone_id = data.aws_route53_zone.ccain-backup_zone.zone_id
    type    = "TXT"
    ttl     = "900"

records = [
    locals.dns_txt
]
} 

