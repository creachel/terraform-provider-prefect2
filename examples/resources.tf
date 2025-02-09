resource "prefect2_workspace" "terraform-workspace" {
    name = "terraform-workspace"
    description = "This is a workspace created with Terraform. WIP"
    handle = "terraform-workspace"
}

resource "prefect2_work_queue" "terraform-work-queue" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    name = "terraform-work-queue"
    description = "This is a work queue created with Terraform. WIP"
    is_paused = true
    concurrency_limit = 4
    priority = 2
}

resource "prefect2_block" "terraform-s3-block" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    name = "terraform-s3-block"
    block_schema_id = data.prefect2_block_schemas.s3_block_schema.block_schemas[0].id
    block_type_id = data.prefect2_block_types.s3_block_type.block_types[0].id
    is_anonymous = false
    data = {
        bucket_path = "terraform-s3-bucket-path"
    }
}

resource "prefect2_block" "terraform-kubernetes-job-block" {
    workspace_id = prefect2_workspace.terraform-workspace.id
    name = "terraform-kubernetes-job-block"
    block_schema_id = data.prefect2_block_schemas.kubernetes_job_block_schema.block_schemas[0].id
    block_type_id = data.prefect2_block_types.kubernetes_job_block_type.block_types[0].id
    is_anonymous = false
    data = {
        image = "123456789123.dkr.ecr.eu-west-1.amazonaws.com/kubernetes-job-block:latest"
    }
}

resource "time_sleep" "wait_for_prefect2_workspace" {
    create_duration = "3s"
    depends_on = [
      prefect2_workspace.terraform-workspace
    ]
}
