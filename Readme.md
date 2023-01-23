# Flask application with docker swarm

Команда, чтобы дать разрешения на выполнение для .sh-скриптов.
```sh
chmod +x *.sh
```

Команда, чтобы запустить службы docker swarm с помощью файла docker-compose.
```sh
./start.sh
```

Команда, чтобы протестировать развернутое приложение, но придется подождать, пока службы не запустятся.
```sh
./test.sh
```

Команда, чтобы пересобрать приложение. Необходимо указать версию, пример 1.1
```sh
./rebuild_app.sh <virsion>
```

Команда, чтобы свернуть приложение и завершить работу локального docker registry
```sh
./clean
```
