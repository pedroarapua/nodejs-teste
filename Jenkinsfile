pipeline {
    def app
    agent any
    stages {
        stage('Build') {
            steps {
                app = docker.build("teste/${env.BUILD_NUMBER}")
            }
        }
        stage('Test') {
            steps {
                app.inside {
                    sh 'npm test'
                }
            }
        }
    }
}
