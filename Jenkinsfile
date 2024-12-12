pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Pavlenko-Kateryna/polytech-labs'
        GIT_BRANCH = 'main'
        DOCKER_IMAGE = 'ubuntu:22.04'
        DEB_PACKAGE = 'debproject.deb'
        SCRIPT = 'script.sh'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: env.GIT_BRANCH, url: env.GIT_REPO
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t docker-image .' 
            }
        }

        stage('Build .deb Package') {
            steps {
                script {
                    sh 'dpkg-deb --build ./deb/debproject.deb'
                }
            }
        }

        stage('Run Script') {
            steps {
                sh 'docker run --rm docker-image /bin/bash -c "./${SCRIPT}"'
            }
        }
    }
}
