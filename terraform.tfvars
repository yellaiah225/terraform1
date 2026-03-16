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

environment         = "development"
vm_name             = "linuxvm01"
vm_size             = "Standard_B1s"
admin_username      = "azureuser"

ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCtZNSnq1TJEV4JYVxiN8VLePbNaKorh0lnhDT9RrAiLKEANIgROjskRshZGRxuQ8c5YvSurPz1AH6USDYg7qXy+ywX/+5H80fnymLCP2F4s72k3SrcBpyFsBm0Y0fm1CicwDSQhxR40WOZDApLvr+BAr+/o+g5veTaW8ITdVZM9AF4cv1cUJeguzZg0CvcV78E98LUjB2EMNx7bt7fD6hAkcd0Fk26wkDkcEEKoSTRJ9thD5H3Tp8LCGfpccccndnwRDOinNFPt4rLthq5cYb9DCoMeo+qrBQxRWUZmU8DfZsY+PGWBCEZTLlXcK7VprXaEOxHuI9tegneuID/d73Uf19RnLQ5PbOsLTCgao4EupqTVWLwjWnbfkGn830wktgzba44X44iSosVxgp2goI+E0PmYIMYLo8k+yhc8QN6/ovBFeASvS42B/v+QI3pzNoGlJ9EvPONuyJ0/xAugVetD4NWZfweDCeXUH2jNyVgq2A59moU+iJ6K989oKNMKpN7kR8likI9m+kn4aSCfTqZcG1qUEz8TRMDU+XvOH1FRatBWqR6BdtfboGWisa4TuVxTu9zxZOh5fB2dqexkpY66iPKfUHEdalNPUI65A7LxsmVKM8cOg3xhnT5w2KHirudfgUHJNCKj1/qaHLfRsbH7thYsde6++yUypCxoq8ycw== test@gmail.com"
