output "ids" {
  value = [
    "${aws_subnet.subnet.*.id}",
  ]
}

output "route_table_id" {
  value = "${aws_route_table.subnet.id}",
}
