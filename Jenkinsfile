pipeline{
    agent any

    stages{
        stage("Clone Code"){
            steps{
            echo "Cloning the code"
            git url:"https://github.com/NarlaRushikesh/my-ci-cd-website.git", branch:"master"
            }
        }

        stage("Build"){
            
            steps{
            echo " Building the docker image"
            bat "docker build -t site ."
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