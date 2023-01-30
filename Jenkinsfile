pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "flask_web"
        DOCKER_COMPOSE_FILE = "docker-compose-jenkins.yml"
    }

    stages {
        stage("Get Docker version") {
            steps{
                sh "echo $USER"
                sh "pwd"
                sh "docker version"
            }
        }

        stage("Build docker image") {
            steps{
                sh "docker build -t $DOCKER_IMAGE_NAME src/"
            }
        }

        stage("Start docker compose") {
            steps{
                sh "docker compose -f $DOCKER_COMPOSE_FILE up -d"
            }
        }
    }
}
