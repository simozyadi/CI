pipeline{

  environment{
         image_name = 'nimrodops/python_app'
         app=''
         }

    agent{

       label 'cdnode' 
        
    }
    stages{
        stage('Build python image'){
            steps{

                app = docker.build image_name + ":$BUILD_NUMBER"
            }


        }

        stage('push python image'){

            steps{

              docker.withRegistry('https://registry.hub.docker.com', 'hub-credentials')
                app.push()
            }
          
        }

                stage('delete local image'){

          steps{

            sh "docker rmi $image_name:$BUILD_NUMBER"
          }


        }


    }
         
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }


}
