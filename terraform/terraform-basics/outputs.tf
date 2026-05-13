output "file_name" {
  description = "The name of the created file"
  value       = local_file.server_info.filename
}

output "random_id" {
  description = "The generated random string"
  value       = random_string.suffix.result
}

output "file_content" {
  description = "The content of the created file"
  value       = local_file.server_info.content
}

output "fixed_file_content" {
  description = "Content of fixed server info file"
  value       = local_file.server_info_fixed.content
}
