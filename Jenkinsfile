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
            steps {
                sh 'apk add --no-cache py-pip'
                script {
                    app.inside {
                        sh 'npm test'
                    }
                }
            }
        }
    }
}
