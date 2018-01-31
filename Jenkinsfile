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
                sh 'sudo apt-get install python-pip'
                script {
                    app.inside {
                        sh 'npm test'
                    }
                }
            }
        }
    }
}
