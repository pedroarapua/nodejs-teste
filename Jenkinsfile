pipeline {
    agent any
    environment {
        IMAGE_ID = "pedroarapua/nodejs-teste"
    }
    stages {
        stage('Build') {
            steps {
                script {
                   app = docker.build("${env.IMAGE_ID}")
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
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}
