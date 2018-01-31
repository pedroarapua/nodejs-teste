pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                   app = docker.build("teste/${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Test') {
            sh 'apk add --no-cache py-pip'
            steps {
                script {
                    app.inside {
                        sh 'npm test'
                    }
                }
            }
        }
    }
}
