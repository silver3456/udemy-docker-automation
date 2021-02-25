pipeline {
    agent none
    stages {
        stage('Build Jar') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                //bat (For Windows)
                sh "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //bat (For Windows)
                sh "docker build -t='silver3456/selenium-docker' ."
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                      //bat (For Windows)
			        sh "docker login --username=${user} --password=${pass}"
			        sh "docker push silver3456/selenium-docker:latest"
			    }                           
            }
        }
    }
}
