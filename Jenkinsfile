pipeline {
    agent { 
        node { 
            label 'docker'
        }
    }
    tools {
        nodejs 'nodejs'
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
