output "classic_elb_http_id" {
  description = "ELB name"
  value       = module.classic_elb_http.elb_id
}

output "classic_elb_http_name" {
  value = module.classic_elb_http.elb_name
}

output "classic_elb_http_instances" {
  value = module.classic_elb_http.elb_instances
}

output "classic_elb_http_sg" {
  value = module.classic_elb_http.elb_source_security_group_id
}

output "classic_elb_http_zone_id" {
  value = module.classic_elb_http.elb_zone_id
}