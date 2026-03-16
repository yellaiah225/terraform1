resource_group_name = "1-ac4b0f4f-playground-sandbox"
vnet_name           = "my-vnet"
vnet_address_space  = ["10.0.0.0/16"]
subnets = [
  {
    name           = "subnet-1"
    address_prefix = "10.0.1.0/24"
  },
  {
    name           = "subnet-2"
    address_prefix = "10.0.2.0/24"
  }
]

