pipeline {
     agent {
         docker 'node'
     }
     stages {
         stage('build') {
             steps {
                 sh 'echo building...'
             }
         }
         stage('test') {
             steps {
                 sh 'echo testing...'
             }
         }
         stage('deploy') {
             steps {
                 retry(3) {
                     sh 'echo deploying...'
                 }
             }
         }
     }
}
