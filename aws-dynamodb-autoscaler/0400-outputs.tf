output "autoscaler_iam_role_id" {
  value       = join("", aws_iam_role.autoscaler.*.id)
  description = "Autoscaler IAM Role ID"
}

output "autoscaler_iam_role_arn" {
  value       = join("", aws_iam_role.autoscaler.*.arn)
  description = "Autoscaler IAM Role ARN"
}

output "appautoscaling_read_target_id" {
  value       = join("", aws_appautoscaling_target.read_target.*.id)
  description = "Appautoscaling read target ID"
}

output "appautoscaling_read_target_index_id" {
  value       = join("", aws_appautoscaling_target.read_target_index.*.id)
  description = "Appautoscaling read target index ID"
}

output "appautoscaling_write_target_id" {
  value       = join("", aws_appautoscaling_target.write_target.*.id)
  description = "Appautoscaling write target ID"
}

output "appautoscaling_write_target_index_id" {
  value       = join("", aws_appautoscaling_target.write_target_index.*.id)
  description = "Appautoscaling write target index ID"
}
