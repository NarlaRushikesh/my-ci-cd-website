pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ubuntu-apache-web'
        CONTAINER_NAME = 'web-container'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/NarlaRushikesh/my-ci-cd-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Stop old container if exists
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    // Run new container on port 82
                    sh "docker run -d -p 82:82 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Build Only') {
            when {
                branch 'develop'
            }
            steps {
                echo "Build done. No deployment for develop branch."
            }
        }
    }

    post {
        always {
            echo "Pipeline finished for branch: ${env.BRANCH_NAME}"
        }
    }
}
