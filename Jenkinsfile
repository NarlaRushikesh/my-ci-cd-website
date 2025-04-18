pipeline {
    agent any

    environment {
        IMAGE_NAME = "site"
        TAG = "latest"
        DOCKER_USER = "narlarushikesh" 
        DOCKER_REPO = "narlarushikesh/site" 
    }

    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/NarlaRushikesh/my-ci-cd-website.git", branch: "master"
            }
        }

        stage("Build") {
            steps {
                echo "Building the Docker image"
                bat "docker build -t %IMAGE_NAME%:%TAG% ."
            }
        }

        stage("Push to Docker Hub") {
            steps {
                echo "Pushing to Docker Hub"
                withCredentials([usernamePassword(credentialsId: "docker-hub-credentials", passwordVariable: "docker-hub-pass", usernameVariable: "docker-hub-id")]) {
                    bat """
                        echo Logging into Docker Hub
                        docker login -u %docker-hub-id% -p %docker-hub-pass%
                        docker tag %IMAGE_NAME%:%TAG% %DOCKER_REPO%:%TAG%
                        docker push %DOCKER_REPO%:%TAG%
                    """
                }
            }
        }

        stage("Deploy") {
            steps {
                echo "Deploying the container"
                bat """
                    docker stop site || echo "No running container"
                    docker rm site || echo "No container to remove"
                    docker run -d -p 81:80 --name site %DOCKER_REPO%:%TAG%
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
