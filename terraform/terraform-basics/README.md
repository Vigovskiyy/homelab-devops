Этот проект демонстрирует работу Terraform с провайдерами local и random.
## Ресурсы
- `random_string.suffix` - генерирует случайную строку
- `random_string.password` - генерирует случайный пароль
- `local_file.server_info` - создаёт файл с информацией
- `local_file.config` - создаёт YAML конфигурацию

## Выводы
- `file_name` - имя созданного файла
- `random_id` - сгенерированный случайный ID
- `file_content` - содержимое файла
- `generated_password` - сгенерированный пароль (sensitive)

## Использование
```bash
terraform init
terraform plan
terraform apply -auto-approve
terraform output
terraform destroy
УЩА
