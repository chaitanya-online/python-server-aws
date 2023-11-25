pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID = "325196226102"
        REGION = "ap-south-1"
        REPO_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/python-server"
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_REGISTRY_CREDENTIALS = 'dockerauth'
    }
    stages {
        stage('Clone') {
            steps {
                script {
                    echo "Clone started"
                    gitInfo = checkout scm
                }
            }
        }

        stage('Docker build') {
            steps {
                script {
                    sh """
                        docker build -t python-server .
                    """
                }
            }
        }

        stage('Image push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh """
                        docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                        docker push richeb/python-server
                        """
                    }
                }
            }
        }
    }
}
