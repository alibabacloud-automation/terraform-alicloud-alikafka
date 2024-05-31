data "alicloud_zones" "default" {
  enable_details = true
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

resource "alicloud_security_group" "default" {
  name   = var.kafka_instance_name
  vpc_id = module.vpc.this_vpc_id
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "example" {
  source = "../.."

  #alicloud_alikafka_instance
  create              = true
  kafka_instance_name = "${var.kafka_instance_name}-${random_integer.default.result}"
  topic_quota         = var.topic_quota
  disk_type           = "1"
  disk_size           = var.disk_size
  deploy_type         = "5"
  io_max              = var.io_max
  vswitch_id          = module.vpc.this_vswitch_ids[0]
  security_group_id   = alicloud_security_group.default.id

  #alicloud_alikafka_consumer_group
  consumer_id = "CID-alikafkaGroupDatasourceName"

  #alicloud_alikafka_topic
  topic         = "alikafkaTopicName"
  local_topic   = false
  compact_topic = false
  partition_num = var.partition_num
  topic_remark  = var.topic_remark

}