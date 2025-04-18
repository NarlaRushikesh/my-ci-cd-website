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
            withCredentials([usernamePassword(credentialsId:"docker-hub-credentials",passwordVariable:"docker-hub-pass",usernameVariable:"docker-hub-id")])
            bat """
            echo Logging into Docker Hub
            docker login -u ${env.docker-hub-id} -p ${env.docker-hub-pass}
            """
            }
            
        }

        stage("Deploy"){
            steps{
             echo "Deploying "
            }
           
        }
    }
}