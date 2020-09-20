pipeline {
  environment {
    registry = "nimrodops/nginx-app"
    registryCredential = 'hub-credentials'
  }
  agent { label 'cdnode'}
  stages {

    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
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
