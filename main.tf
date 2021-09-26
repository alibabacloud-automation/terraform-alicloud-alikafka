resource "alicloud_alikafka_instance" "default" {
  count          = var.instance_id != "" ? 0 : var.create ? 1 : 0
  name           = var.kafka_instance_name
  topic_quota    = var.topic_quota
  disk_type      = var.disk_type
  disk_size      = var.disk_size
  deploy_type    = var.deploy_type
  io_max         = var.io_max
  vswitch_id     = var.vswitch_id
  security_group = var.security_group_id
}

resource "alicloud_alikafka_consumer_group" "default" {
  consumer_id = var.consumer_id
  instance_id = var.instance_id != "" ? var.instance_id : concat(alicloud_alikafka_instance.default.*.id, [""])[0]
}

resource "alicloud_alikafka_topic" "default" {
  instance_id   = var.instance_id != "" ? var.instance_id : concat(alicloud_alikafka_instance.default.*.id, [""])[0]
  topic         = var.topic
  local_topic   = var.local_topic
  compact_topic = var.compact_topic
  partition_num = var.partition_num
  remark        = var.topic_remark
}
