pipeline {
    agent { 
        node { 
            label 'docker'
        }
    }
    //agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
