pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                   app = docker.build("pedroarapua/nodejs-teste-${env.BUILD_NUMBER}")
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
