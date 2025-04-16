pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/NarlaRushikesh/my-ci-cd-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-cicd-website .'
                }
            }
        }

        stage('Remove Old Container') {
            steps {
                script {
                    sh 'docker rm -f my-cicd-site || true'
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:80 --name my-cicd-site my-cicd-website'
                }
            }
        }
    }
}
