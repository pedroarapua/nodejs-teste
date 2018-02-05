pipeline {
  agent any
  environment {
      IMAGE_ID = "pedroarapua/nodejs-teste:${env.BRANCH_NAME}-${env.BUILD_ID}"
  }
  stages {
    stage('Build') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-pedro') {
            app = docker.build("${env.IMAGE_ID}")
          }
        }
      }
    }
    stage('Test') {
      steps {
        //sh 'sudo apt-get install python-pip'
        script {
          docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"') { c ->
            docker.image('mysql:5').inside("--link ${c.id}:db") {
              /* Wait until mysql service is up */
              sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
            }
            app.inside("--link ${c.id}:db") {
              /*
               * Run some tests which require MySQL, and assume that it is
               * available on the host name `db`
               */
              sh 'npm test'
            }
          }          
        }
      }
    }
    stage('Release') {
      when { 
        anyOf { 
          branch 'master'; 
          branch 'staging' 
        } 
      }

      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-pedro') {
            app.push()
            app.push("latest")
          }
        }
      }
    }
    stage('Deploy Staging') {
      when {
         branch "hml"
      }
      steps {
        script {
          sh 'echo "staging"'
        }
      }
    }
    stage('Deploy Production') {
      when {
         branch "master"
      }
      steps {
        timeout(time: 5, unit: 'DAYS') {
          input "Does the staging environment for ${env.APP_NAME} look ok?"
          script {
            sh 'echo "production"'
          }
        }
      }
    }
  }
}
