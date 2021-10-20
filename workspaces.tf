/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      hosts_count = 1 /* number of hosts in each DC */

      env   = "go-waku"
      stage = terraform.workspace

      do_type = "s-1vcpu-1gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m1.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */

      dns_records = []
    }

    # Inherits defaults.
    test = {}
    prod = {}
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
