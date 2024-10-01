Задача:
Развернуть через Terraform Wordpress с БД MySQL на инджинкс.
Все в K8s kluster, Helm chart.
Это сделать отказоустойчивым. 
Обвязать мониторингом. Сбор логов. аллерты.

Решение:
Infra: Yandex Cloud. K8s regional cluster, MySQL cluster.
Deployments: HelmWave with charts externaldns, cert manager, nginx, wordpress, prometheus stack.

Зависимости:
YC, Terraform, Kubernetes, Helm, HelmWave, Brew(for MacOs). Развертывалось с MacOS Monterey 12.7.5.

Процесс по порядку:

Настроить YC, создать СА с необходимыми правами доступа, Я работал с Oauth tocken. 

Создать YC iam key:
  yc iam key create \
  --service-account-id '<id Сервисного Аккаунта>' \
  --output key.json


Инфраструктура:
    Для хранения tf state я использовал S3 bucket cозданный так же в Yandex Cloud. Бэкенд нужно настроить в файлах main.tf
    1. Network - Поднимает сеть, днс, статический айпи, группы безопасности. Переменные вынесены в файл (необходимые для настройки отмечены) terraform.tfvars
        terraform apply
    2. K8S - Поднимает кластер. Аналогично сетям настраиваем terraform.tfvars
        terraform apply 
    3. MySQL - Поднимает кластер MySql. Аналогично сетям настраиваем terraform.tfvars
        terraform apply

Подключаемся к K8s кластеру:
yc managed-kubernetes cluster get-credentials --id <id cluster kubernetes> --external

Хелм чарты:
    1. Задать нужные значения в файлах values/values.*.yaml
    2. Подготовить Helmwave к деплою командой:
        helmwave build
    3. Деплой:
        helmwave up

Сертификат:
    kubectl apply -f certificate.yaml


ToDo: 
- В инфре перенастроить аутпуты для удобства.
- Настроить мониторинг. Добавить Локи? Надо собирать логи с нжинкса и вордпресса. Кластер пишет логи, хранит вне кластера, рассмотреть вариант YC monitoring. 
- CI/CD GitOPS