    pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-cicd-website'
        CONTAINER_NAME = 'my-cicd-site'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/NarlaRushikesh/my-ci-cd-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove container if it already exists
                   bat """
                    cmd /c "docker rm -f ${CONTAINER_NAME} || echo 'No existing container'"
                    cmd /c "docker run -d --name ${CONTAINER_NAME} -p 8080:80 ${IMAGE_NAME}"
                    """
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Docker Image Built and Container is Running on Port 8080!'
        }
        failure {
            echo '❌ Build Failed. Check the console for errors.'
        }
    }
}

