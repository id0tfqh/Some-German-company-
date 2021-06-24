/* Print server IP */
output "server_ip" {
    value = aws_instance.something-application.*.public_ip
    description = "The public IP address of the main server instance."
}

/* Print Regestry name */
output "regestry_name" {
    value = aws_ecr_repository.some-Germany-company.repository_url
    description = ""
}