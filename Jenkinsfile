pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            steps {
                //bat (For Windows)
                sh "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //bat (For Windows)
                sh "docker build -t='vinsdocker/selenium-docker' ."
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