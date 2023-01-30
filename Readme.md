# Flask application with devops tools

## Содержание:
1. [Docker compose](#Docker-compose)
2. [Docker swarm](#Docker-swarm)
3. [Jenkins](#Jenkins)   
  3.1. [Создание проекта и запуск pipeline](#Создание-проекта-и-запуск-pipeline)


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
