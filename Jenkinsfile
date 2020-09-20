pipeline {



    environment {
        DOCKER_REGISTRY = "https://hub.docker.com"
        APP_IMAGE_NAME = "${DOCKER_REGISTRY}/nimrodops/labci"
        APP_VERSION = "${BUILD_TAG}".toLowerCase()
    }

    agent {
        label 'cdnode'
    }


    stages {
              

        stage('Build & Push Docker image') {
         
            
            steps {
               
                script {
                    withCredentials([
                        usernamePassword(credentialsId: 'hub-credentials', passwordVariable: 'HUB_PASSWORD', usernameVariable: 'HUB_USERNAME'),
                        
                    ]) {
                        sh """
                            docker login -u ${HUB_USERNAME} -p ${HUB_PASSWORD} ${DOCKER_REGISTRY}
                            docker build -t ${APP_IMAGE_NAME}:${env.APP_VERSION} .
                            docker push ${APP_IMAGE_NAME}:${env.APP_VERSION}
                          
                        """
                    }
                }
            }
        }
    }
}

