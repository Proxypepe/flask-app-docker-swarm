# Flask application with devops tools

## Содержание:

1. [Docker compose](#Docker-compose)
2. [Docker swarm](#Docker-swarm)
3. [Jenkins](#Jenkins)   
   3.1. [Создание проекта и запуск pipeline](#Создание-проекта-и-запуск-pipeline)
4. [Minikube](#Minikube)
5. [Helm](#Helm)

## Docker compose

Команда для запуска docker compose:

```sh
docker compose -f pure_docker_compose/docker-compose.yml up -d
```

<figure>
  <img
  src="images/docker/start.png"
  alt="start compose">
  <figcaption>Запуск docker compose</figcaption>
</figure>

Чтобы проверить работоспособность, воспользуемся утилитой curl:

```
curl localhost:5000
```

<figure>
  <img
  src="images/docker/result.png"
  alt="flask app result">
  <figcaption>Результат работы flask приложения</figcaption>
</figure>

## Docker swarm

Команда, чтобы дать разрешения на выполнение для .sh-скриптов:

```sh
chmod +x *.sh
```

<figure>
  <img
  src="images/docker/permissions.png"
  alt="Permissions">
  <figcaption>Командой выданы права на выполнение</figcaption>
</figure>

Команда, чтобы запустить службы docker swarm с помощью файла docker-compose:

```sh
./start.sh
```

<figure>
  <img
  src="images/docker/stack_result.png"
  alt="Start docker deployment">
  <figcaption>Запущенный docker swarm</figcaption>
</figure>

Команда, чтобы протестировать развернутое приложение, но придется подождать, пока службы не запустятся:

```sh
./test.sh
```

<figure>
  <img
  src="images/docker/not_yet.png"
  alt="Not yet started">
  <figcaption>Сервис ещё не готов</figcaption>
</figure>

<figure>
  <img
  src="images/docker/stack_test.png"
  alt="Test result">
  <figcaption>Результат тестирования</figcaption>
</figure>

Команда, чтобы пересобрать приложение. Необходимо указать версию, пример 1.1:

```sh
./rebuild_app.sh <virsion>
```

<figure>
  <img
  src="images/docker/rebuild_part_1.png"
  alt="Run rebuild script">
  <figcaption>Часть вывода скрипта</figcaption>
</figure>
<figure>
  <img
  src="images/docker/rebuild_part_2.png"
  alt="Rebuild a new version">
  <figcaption>Обновленная версия запущена</figcaption>
</figure>

Команда, чтобы зайти в контейнер:

```sh
./connect.sh
```

<figure>
  <img
  src="images/docker/connect.png"
  alt="Connection to container">
  <figcaption>Результат тестирования</figcaption>
</figure>

Команда, чтобы свернуть приложение и завершить работу локального docker registry:

```sh
./clean.sh
```

<figure>
  <img
  src="images/docker/clean.png"
  alt="Remove docker deployment">
  <figcaption>Завершение и удаление контейнеров</figcaption>
</figure>

## Jenkins

Для запуска необходимо установить:

1. jenkins
2. docker compose
3. java

<figure>
  <img
  src="images/jenkins/apps_versions.png"
  alt="Apps versions">
  <figcaption>Версии ПО на машине</figcaption>
</figure>

### Создание проекта и запуск pipeline

<figure>
  <img
  src="images/jenkins/setup_pipeline.png"
  alt="Apps versions">
  <figcaption>Создание проекта</figcaption>
</figure>

<figure>
  <img
  src="images/jenkins/add_github_link.png"
  alt="Paste the link to the git repository">
  <figcaption>Вставляем ссылку на git-репозиторий</figcaption>
</figure>

<figure>
  <img
  src="images/jenkins/choose_branch.png"
  alt="Choose a branch">
  <figcaption>Выбираем ветку</figcaption>
</figure>

<figure>
  <img
  src="images/jenkins/empty_page.png"
  alt="Created project page">
  <figcaption>Страница созданного проекта</figcaption>
</figure>

<figure>
  <img
  src="images/jenkins/result_pipeline.png"
  alt="Pipeline launch result">
  <figcaption>Результат запуска pipeline</figcaption>
</figure>

<figure>
  <img
  src="images/jenkins/test_result.png"
  alt="Flask app test result">
  <figcaption>Тестирование приложения</figcaption>
</figure>


Команда, чтобы завершить выполнение docker compose:

```sh
chmod +x stop-jenkins-compose.sh
./stop-jenkins-compose.sh <название проекта>
```

## Minikube

Для запуска необходимо установить:

1. docker
2. docker compose
3. minikube
4. kubectl

Команда, чтобы запустить minikube.

```sh
minikube start
```

<figure>
  <img
  src="images/minikube/minikube_start.png"
  alt="Flask app test result">
  <figcaption>Запуск minikube</figcaption>
</figure>

Запустить манифесты можно тремя способами:

1. Использовать скрипт start в директории k8s/

Нужна утилита kubectl

```sh
chomod +x start.sh
chomod +x flask/start.sh
chomod +x mysql/start.sh
./start
```

2. Последовательно запустит все манифесты

Нужна утилита kubectl или следующий алиас

```sh
alias kubectl='minikube kubectl --'
```

Последовательность:

```sh
kubectl apply -f mysql/mysql-secret.yaml
kubectl apply -f mysql/mysql-storage.yaml
kubectl apply -f mysql/mysql-deployment.yaml
kubectl apply -f mysql/mysql-service.yaml
kubectl apply -f flask/flask-secret.yaml
kubectl apply -f flask/flask-deployment.yaml
kubectl apply -f flask/flask-service.yaml
```

3. Использовать пакетный менеджер Helm 3

[Рассматривается здесь](#Helm).

Проверим работу способов 1 и 2.   
Получаем доступ к командной строке контейнера с mysql и подключаемся к mysql, используя секретный пароль.
<figure>
  <img
  src="images/minikube/mysql_dep.png"
  alt="Flask app test result">
  <figcaption>mysql deployment</figcaption>
</figure>

<figure>
  <img
  src="images/minikube/deploy.png"
  alt="Flask app test result">
  <figcaption>Show deployments</figcaption>
</figure>

<figure>
  <img
  src="images/minikube/services.png"
  alt="Flask app test result">
  <figcaption>Show services</figcaption>
</figure>

Команда для получения доступа к командной строке контейнера

```sh
chmod +x exec.sh
./exec.sh <pod id> <shell>
```

<figure>
  <img
  src="images/minikube/exec.png"
  alt="Flask app test result">
  <figcaption>Получаем доступ к командной строке контейнера</figcaption>
</figure>

<figure>
  <img
  src="images/minikube/curl.png"
  alt="Flask app test result">
  <figcaption>Results</figcaption>
</figure>

## Helm

Использовалось:

1. microk8s
2. microk8s dns addon
3. microk8s helm3 | helm

Запуск:  
Работа производится в директории helm  
Запускаем helm chart

```sh
microk8s helm3 install <release name> <chart>
```

или утилитой

```sh
helm install <release name> <chart>
```

<figure>
  <img
  src="images/helm/install_mysql.png"
  alt="Run mysql">
  <figcaption>Запуск mysql chart</figcaption>
</figure>

<figure>
  <img
  src="images/helm/install_flask.png"
  alt="Run flask">
  <figcaption>Запуск flask chart</figcaption>
</figure>

<figure>
  <img
  src="images/helm/list.png"
  alt="Chart list">
  <figcaption>Список используемых чартов</figcaption>
</figure>

<figure>
  <img
  src="images/helm/pods.png"
  alt="Get pods">
  <figcaption>Проверка работы подов</figcaption>
</figure>

<figure>
  <img
  src="images/helm/test.png"
  alt="Flask app test result">
  <figcaption>Результаты тестирования</figcaption>
</figure>

<figure>
  <img
  src="images/helm/end.png"
  alt="">
  <figcaption>Завершение работы чарта</figcaption>
</figure>
