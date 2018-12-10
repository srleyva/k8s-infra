variable CLUSTER_NAME {}
variable NODE_COUNT {}

resource "google_container_cluster" "primary" {
  name               = "${var.CLUSTER_NAME}"
  zone               = "${var.GOOGLE_COMPUTE_ZONE}"
  initial_node_count = "${var.NODE_COUNT}"

  node_config {
    tags = ["environment", "${var.ENVIRONMENT}"]
  }
}
