#alicloud_alikafka_instance
variable "kafka_instance_name" {
  description = "The specification of kafka instance name."
  type        = string
  default     = "tf-kafka-instance-name-test"
}

variable "topic_quota" {
  description = "The max num of topic can be create of the instance. When modify this value, it only adjust to a greater value."
  type        = string
  default     = "50"
}

variable "disk_size" {
  description = "The disk size of the instance. When modify this value, it only support adjust to a greater value."
  type        = string
  default     = "500"
}

variable "io_max" {
  description = "The max value of io of the instance. When modify this value, it only support adjust to a greater value."
  type        = string
  default     = "20"
}


#alicloud_alikafka_topic
variable "partition_num" {
  description = "The number of partitions of the topic."
  type        = number
  default     = 12
}

variable "topic_remark" {
  description = "This attribute is a concise description of topic."
  type        = string
  default     = "kafka-topic-remark"
}
