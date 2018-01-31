pipeline {
    agent any
    environment {
        IMAGE_ID_NUMBER = "pedroarapua/nodejs-teste:${env.BUILD_NUMBER}"
        IMAGE_ID_LATEST = "pedroarapua/nodejs-teste:latest"
    }
    stages {
        stage('Build') {
            steps {
                script {
                   app = docker.build("${env.IMAGE_ID_NUMBER}")
                }
            }
        }
        stage('Test') {
            steps {
                //sh 'sudo apt-get install python-pip'
                script {
                    app.inside {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Staging') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-pedro') {
                        app.push("${env.IMAGE_ID_NUMBER}")
                        app.push("${env.IMAGE_ID_LATEST}")
                    }
                }
            }
        }
    }
}
