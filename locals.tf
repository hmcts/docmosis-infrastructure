locals {
  hub = {
    sbox = {
      subscription = "ea3a8c1e-af9d-4108-bc86-a7e2d267f49c"
      ukSouth = {
        name         = "hmcts-hub-sbox-int"
        peering_name = "hubUkS"
        next_hop_ip  = "10.10.200.36"
      }
    }
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
      ukSouth = {
        name         = "hmcts-hub-nonprodi"
        peering_name = "hubUkS"
        next_hop_ip  = "10.11.72.36"
      }
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
      ukSouth = {
        name         = "hmcts-hub-prod-int"
        peering_name = "hubUkS"
        next_hop_ip  = "10.11.8.36"
      }
    }
  }
  hub_to_env_mapping = {
    sbox    = ["sbox", "ptlsbox"]
    nonprod = ["demo", "dev", "aat", "test", "ithc", "ptl", "stg"]
    prod    = ["prod", "stg", "ptl"]
  }
  hub_name = [for x in keys(local.hub_to_env_mapping) : x if contains(local.hub_to_env_mapping[x], var.env)][0]
}
