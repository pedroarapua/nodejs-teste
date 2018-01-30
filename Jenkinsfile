pipeline {
    agent { node { label 'swarm-ci' } }
    //agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
