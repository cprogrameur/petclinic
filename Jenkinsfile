pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials here
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        DOCKER_IMAGE = 'your-dockerhub-username/your-spring-boot-app'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Spring Boot application using Maven
                    sh './mvnw clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                    // Push Docker image to Docker Hub
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Remove any existing container
                    sh 'docker rm -f spring-boot-app || true'
                    // Run a new container
                    sh 'docker run -d --name spring-boot-app -p 8080:8080 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            // Use the same label as the main pipeline agent
            node('mynode') {
                // Clean up any leftover Docker resources
                sh 'docker system prune -f'
            }
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
