
# data "yandex_compute_instance" "int_kibana_ip" {
#     name = "kibana"
#     #instance_id = "epd37iifqpk4hff6rn5p"
# }

# variable "intkib" {
#   description = "CIDR block for VPC"
#   default     = data.yandex_compute_instance.int_kibana_ip.network_interface.0.ip_address
#    # default = ${internal_ip_address_kibana}
# }

# output "hjdsfh" {
#     value = merge(data.yandex_compute_instance.int_kibana_ip.network_interface.0.ip_address, ",nsdvhkjsdf")
# }

resource "yandex_vpc_security_group" "elastic_sg" {
  name        = "elastic_sg"
  description = "elastic"
  network_id  = "${yandex_vpc_network.network-1.id}"

  labels = {
    my-label = "my-label-value"
  }

  ingress {
    protocol       = "TCP"
    description    = "ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    #security_group_id = yandex_vpc_security_group.bastion111.id
    port           = 22
  }

    ingress {
        protocol       = "TCP"
        description    = "kibana9200"
        security_group_id = yandex_vpc_security_group.kibana_sg.id
        port           = 9200
    }

    ingress {
        protocol       = "TCP"
        description    = "webservers5044"
        security_group_id = yandex_vpc_security_group.webservers_sg.id
        port           = 5044
    }

#   ingress {
#     protocol       = "TCP"
#     description    = "kibana"
#     v4_cidr_blocks = [merge("${data.yandex_compute_instance.int_kibana_ip.network_interface.0.ip_address}", {"/32"})]
#     port           = 9200
#   }


  egress {
    protocol       = "ANY"
    description    = "anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}