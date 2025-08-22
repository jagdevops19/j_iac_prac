resource "aws_route53_zone" "jagatback" {
    name = "jagatback.com"
    comment = "Managed by Terraform"
  
}   
resource "aws_route53_record" "server1_record" {
    zone_id = aws_route53_zone.jagatback.zone_id
    name    = "server1.jagatback.com"
    type    = "A"
    ttl     = "300"
    records = ["104.236.247.8"]
  
}   
resource "aws_route53_record" "www_record" {
    zone_id = aws_route53_zone.jagatback.zone_id
    name    = "www.jagatback.com"
    type    = "CNAME"
    ttl     = "300"
    records = ["104.236.247.8"]
  
}
resource "aws_route53_record" "mail_record" {
    zone_id = aws_route53_zone.jagatback.zone_id
    name    = "mail.jagatback.com"
    type    = "MX"
    ttl     = "300"
    records = [
        "1 aspmx.l.google.com.",
        "5 alt1.aspmx.l.google.com.",
        "5 alt2.aspmx.l.google.com.",
        "10 aspmx2.googlemail.com.",
        "10 aspmx3.googlemail.com."
    ]   
}       
output "ns-servers" {
    value = aws_route53_zone.jagatback.name_servers
    description = "The nameservers of the Route53 hosted zone"
}



  