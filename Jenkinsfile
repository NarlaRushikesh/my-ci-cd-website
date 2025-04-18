pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-webpage'      // Docker image name
        CONTAINER_NAME = 'web-container' // Container name
    }

    triggers {
        // Webhook trigger for GitHub
        githubPush()

        // Schedule trigger to run daily at 8AM UTC
        cron('H 8 * * *')
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
                    // Building the Docker image using the Dockerfile
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'master'  // Only deploy on master branch
            }
            steps {
                script {
                    // Stop the old container if it exists
                    sh "docker rm -f ${CONTAINER_NAME} || true"

                    // Run the new container on port 8080
                    sh "docker run -d -p 8081:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Build Only') {
            when {
                branch 'develop'  // Just build for develop branch, no deployment
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
