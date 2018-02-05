pipeline {
    agent any
    environment {
        IMAGE_ID = "pedroarapua/nodejs-teste"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-pedro') {
                        app = docker.build("${env.IMAGE_ID}:10")
                        app.push()
                    }
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
        
    }
}
