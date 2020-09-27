pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Scan') {
            steps {
		script {
			withSonarQubeEnv('sqserv') {
				sh """mvn sonar:sonar \
  -Dsonar.projectKey=mvnone \
  -Dsonar.host.url=http://sonar-rueil.northeurope.cloudapp.azure.com \
  -Dsonar.login=50c4c7679593974ffe59a1c9265292d7974c694e
				"""
			}
		}
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
               echo "Deploy OK" 
            }
        }
    }
}
