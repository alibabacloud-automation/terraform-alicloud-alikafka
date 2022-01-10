#alicloud_alikafka_instance
variable "create" {
  description = "Whether to create instance. If false, you can specify an existing instance by setting 'instance_id'."
  type        = bool
  default     = true
}

variable "kafka_instance_name" {
  description = "The specification of kafka instance name."
  type        = string
  default     = ""
}

variable "topic_quota" {
  description = "The max num of topic can be create of the instance. When modify this value, it only adjust to a greater value."
  type        = string
  default     = "50"
}

variable "disk_type" {
  description = "The disk type of the instance. 0: efficient cloud disk,1: SSD."
  type        = string
  default     = "1"
}

variable "disk_size" {
  description = "The disk size of the instance. When modify this value, it only support adjust to a greater value."
  type        = string
  default     = "500"
}

variable "deploy_type" {
  description = "The deploy type of the instance. Currently only support two deploy type, 4: eip/vpc instance, 5: vpc instance."
  type        = string
  default     = "5"
}

variable "io_max" {
  description = "The max value of io of the instance. When modify this value, it only support adjust to a greater value."
  type        = string
  default     = "20"
}

variable "vswitch_id" {
  description = "The specification of vswitch_id."
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "A list of security group ids to associate with."
  type        = string
  default     = ""
}

#alicloud_alikafka_consumer_group
variable "consumer_id" {
  description = "The specification of kafka consumer_id."
  type        = string
  default     = ""
}

variable "instance_id" {
  description = "The instance_id used to launch several kafka. If set, the 'create' will be ignored."
  type        = string
  default     = ""
}

#alicloud_alikafka_topic
variable "topic" {
  description = "Name of the topic. Two topics on a single instance cannot have the same name."
  type        = string
  default     = ""
}

variable "local_topic" {
  description = "Whether the topic is localTopic or not."
  type        = bool
  default     = false
}

variable "compact_topic" {
  description = "Whether the topic is compactTopic or not."
  type        = bool
  default     = false
}

variable "partition_num" {
  description = "The number of partitions of the topic."
  type        = number
  default     = 12
}

variable "topic_remark" {
  description = "This attribute is a concise description of topic."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "The available zone to launch modules."
  type        = string
  default     = ""
}