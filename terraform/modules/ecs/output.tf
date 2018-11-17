output "flask_url" {
  description = "flask app url"
  value       = "${aws_elb.flask-app-elb.dns_name}"
}