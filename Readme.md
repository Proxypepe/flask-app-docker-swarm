# Flask application with docker compose and swarm

## Docker compose

Команда для запуска docker compose.
```sh
docker compose -f pure_docker_compose/docker-compose.yml up -d
```
<figure>
  <img
  src="images/start.png"
  alt="start compose">
  <figcaption>Запуск docker compose</figcaption>
</figure>

Чтобы проверить работоспособность, воспользуемся утилитой curl.
```
curl localhost:5000
```

<figure>
  <img
  src="images/result.png"
  alt="flask app result">
  <figcaption>Результат работы flask приложения</figcaption>
</figure>

## Docker swarm

Команда, чтобы дать разрешения на выполнение для .sh-скриптов.
```sh
chmod +x *.sh
```
<figure>
  <img
  src="images/permissions.png"
  alt="Permissions">
  <figcaption>Командой выданы права на выполнение</figcaption>
</figure>

Команда, чтобы запустить службы docker swarm с помощью файла docker-compose.
```sh
./start.sh
```
<figure>
  <img
  src="images/stack_result.png"
  alt="Start docker deployment">
  <figcaption>Запущенный docker swarm</figcaption>
</figure>

Команда, чтобы протестировать развернутое приложение, но придется подождать, пока службы не запустятся.
```sh
./test.sh
```
<figure>
  <img
  src="images/not_yet.png"
  alt="Not yet started">
  <figcaption>Сервис ещё не готов</figcaption>
</figure>

<figure>
  <img
  src="images/stack_test.png"
  alt="Test result">
  <figcaption>Результат тестирования</figcaption>
</figure>

Команда, чтобы пересобрать приложение. Необходимо указать версию, пример 1.1.
```sh
./rebuild_app.sh <virsion>
```
<figure>
  <img
  src="images/rebuild_part_1.png"
  alt="Run rebuild script">
  <figcaption>Часть вывода скрипта</figcaption>
</figure>
<figure>
  <img
  src="images/rebuild_part_2.png"
  alt="Rebuild a new version">
  <figcaption>Обновленная версия запущена</figcaption>
</figure>

Команда, чтобы зайти в контейнер.
```sh
./connect.sh
```
<figure>
  <img
  src="images/connect.png"
  alt="Connection to container">
  <figcaption>Результат тестирования</figcaption>
</figure>

Команда, чтобы свернуть приложение и завершить работу локального docker registry.
```sh
./clean
```
<figure>
  <img
  src="images/clean.png"
  alt="Remove docker deployment">
  <figcaption>Завершение и удаление контейнеров</figcaption>
</figure>

