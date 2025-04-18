pipeline{
    agent any
    stages{
        stage("code"){
            echo "Cloning the code"
        }

        stage("Build"){
            echo " Building the docker image"
        }

        stage("Push to Docker Hub"){
            echo "Pushing to docker hub"
        }

        stage("Deploy"){
            echo "Deploying "
        }
    }
}