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
            app = docker.build("${env.IMAGE_ID}:${env.BRANCH_NAME}-${env.BUILD_ID}")
          }
        }
      }
    }
    stage('Test') {
      steps {
        //sh 'sudo apt-get install python-pip'
        script {
          docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"') { c ->
            app.inside("--link ${c.id}:db") {
              /*
               * Run some tests which require MySQL, and assume that it is
               * available on the host name `db`
               */
              //sh 'make check'
              app.inside {
                sh 'npm test'
              }
            }
          }          
        }
      }
    }
    stage('Staging') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-pedro') {
            app.push()
            app.push("latest")
          }
        }
      }
    }
  }
}
