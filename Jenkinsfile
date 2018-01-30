pipeline {
    agent { dockerfile true label 'teste-tag' }
    stages {
        stage('Test') {
            steps {
                sh 'ls'
            }
        }
    }
}
