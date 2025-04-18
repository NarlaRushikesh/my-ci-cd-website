pipeline{
    agent any

    stages{
        stage("code"){
            steps{
            echo "Cloning the code"
            }
        }

        stage("Build"){
            
            steps{
            echo " Building the docker image"
            }
        }

        stage("Push to Docker Hub"){
            steps{
            echo "Pushing to docker hub"
            }
            
        }

        stage("Deploy"){
            steps{
             echo "Deploying "
            }
           
        }
    }
}