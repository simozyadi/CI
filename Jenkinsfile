pipeline {
  environment {
    registry = "nimrodops/nginx-app"
    registryCredential = 'hub-credentials'
    dockerImage = ''
  }
  agent { label 'cdnode' }
  stages {
   
    stage('Docker: Build Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Docker: Push Image to Hub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Docker: Remove Local Image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
