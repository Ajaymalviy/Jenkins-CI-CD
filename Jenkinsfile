pipeline {
    agent any

    triggers {
        pollSCM('H/2 * * * *')
    }

    environment {
        IMAGE_NAME = "html-nginx-app"
        CONTAINER_NAME = "html-nginx-container"
        APP_PORT = "8085"
    }

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker run -d \
                    --name $CONTAINER_NAME \
                    -p $APP_PORT:80 \
                    $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully on Docker"
        }
        failure {
            echo "❌ Pipeline failed"
        }
        always {
            echo "Pipeline finished"
        }
    }
}
