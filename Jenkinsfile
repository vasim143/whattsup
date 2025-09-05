pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-1"
        AWS_ACCOUNT_ID = "637423394741"
        REPO_NAME = "devops" // your ECR repository name
        IMAGE_TAG = "latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO_NAME}"
        AWS_ACCESS_KEY_ID = "cloud_user"        // replace with your AWS access key ID
        AWS_SECRET_ACCESS_KEY = "D_tC6n=l!ClK652iSBw|"  // replace with your AWS secret key
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image from tweet/ folder
                    sh "docker build -t ${REPO_NAME}:${IMAGE_TAG} tweet/"
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    sh """
                    aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
                    aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
                    aws configure set default.region ${AWS_REGION}

                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${REPOSITORY_URI}
                    """
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh """
                    docker tag ${REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:${IMAGE_TAG}
                    docker push ${REPOSITORY_URI}:${IMAGE_TAG}
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Docker image pushed successfully to ECR!"
        }
        failure {
            echo "Build or push failed."
        }
    }
}

