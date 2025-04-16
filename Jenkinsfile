pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/NarlaRushikesh/my-ci-cd-website.git'
            }
        }

        stage('Remove Old Container') {
            steps {
                script {
                    // Remove old container if it exists (force remove with -f flag)
                    sh 'docker rm -f my-cicd-site || true'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image (assuming Dockerfile is in the repo)
                    sh 'docker build -t my-cicd-website .'
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    // Run the new container with the built image
                    sh 'docker run -d -p 9090:80 --name my-cicd-site my-cicd-website'
                }
            }
        }

        stage('Verify Container') {
            steps {
                script {
                    // Optionally verify the container is running and responding
                    sh 'curl -f http://localhost:9090 || exit 1'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optionally clean up the image after testing
                    sh 'docker rmi my-cicd-website || true'
                }
            }
        }
    }
}
