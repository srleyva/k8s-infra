variable CLUSTER_NAME {}
variable NODE_COUNT {}

variable MACHINE_TYPE {
  default = " n1-standard-1"
}

resource "google_container_cluster" "primary" {
  name               = "${var.CLUSTER_NAME}"
  initial_node_count = "${var.NODE_COUNT}"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "${var.MACHINE_TYPE}"

    tags = ["environment", "${var.ENVIRONMENT}"]
  }
}
