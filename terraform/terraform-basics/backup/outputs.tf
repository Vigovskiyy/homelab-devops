output "file_name" {
  value = local_file.server_info.filename
}

output "random_id" {
  value = random_string.suffix.result
}
