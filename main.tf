variable CLUSTER_NAME {}
variable MIN_NODE_COUNT {}
variable MAX_NODE_COUNT {}

variable MACHINE_TYPE {
  default = "n1-standard-1"
}

resource "google_container_cluster" "primary" {
  name               = "${var.CLUSTER_NAME}"
  initial_node_count = "${var.MIN_NODE_COUNT}"

  node_pool {
    name = "default-pool"

    autoscaling {
      min_node_count = "${var.MIN_NODE_COUNT}"
      max_node_count = "${var.MAX_NODE_COUNT}"
    }

    node_config {
      preemptible  = false
      disk_size_gb = 100
      machine_type = "${var.MACHINE_TYPE}"

      oauth_scopes = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
      ]

      tags = ["environment", "${var.ENVIRONMENT}"]
    }
  }
}
