output "this_kafka_instance_id" {
  value = var.instance_id != "" ? var.instance_id : concat(alicloud_alikafka_instance.default.*.id, [""])[0]
}

output "this_kafka_consumer_group_id" {
  value = alicloud_alikafka_consumer_group.default.id
}

output "this_zone_id" {
  value = var.availability_zone
}

output "this_kafka_instance_name" {
  value = var.instance_id != "" ? var.kafka_instance_name : concat(alicloud_alikafka_instance.default.*.name, [""])[0]
}
