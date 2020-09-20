pipeline {
  environment {
    registry = "nimrodops/nginx-app"
    registryCredential = 'hub-credentials'
    dockerImage = ''
  }
  agent { label 'cdnode' }
  stages {
   
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
