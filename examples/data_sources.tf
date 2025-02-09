# all workspaces
#data "prefect2_workspaces" "all_workspaces" {}

# all workspace work queues
# data "prefect2_work_queues" "all_workspace_work_queues" {
#   workspace_id = prefect2_workspace.terraform-workspace.id
# }

# specific workspace work queue
# data "prefect2_work_queues" "specific_workspace_work_queue" {
#   workspace_id = prefect2_workspace.terraform-workspace.id
#   work_queue_id = prefect2_work_queue.terraform-work-queue.id
# }

# specific workspace block documents
# data "prefect2_block_documents" "specific_workspace_block_document" {
#   workspace_id = prefect2_workspace.terraform-workspace.id
#   block_document_id = prefect2_block.terraform-s3-block.id
# }

# S3 block type and schema (helpers)

data "prefect2_block_types" "s3_block_type" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    slug = "s3"
    depends_on = [
        time_sleep.wait_for_prefect2_workspace
    ]
}

data "prefect2_block_schemas" "s3_block_schema" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    checksum = "sha256:77690b4ef54ef3edc93fca6ac54bc540a32ca07169e91aecd36e49b2e1eeebc5"
    depends_on = [
        time_sleep.wait_for_prefect2_workspace
    ]
}

# KubernetesJob block type and schema (helpers)

data "prefect2_block_types" "kubernetes_job_block_type" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    slug = "kubernetes-job"
    depends_on = [
        time_sleep.wait_for_prefect2_workspace
    ]
}

data "prefect2_block_schemas" "kubernetes_job_block_schema" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    checksum = "sha256:1a553852c1bcc9cd95645917bdbaaae9e28cbcc1270ff5b43b45bbd87564f5cc"
    depends_on = [
        time_sleep.wait_for_prefect2_workspace
    ]
}