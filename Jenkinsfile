pipeline {
    agent any
        
    triggers {
        pollSCM('* * * * *')
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

        stage('Clone Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Ajaymalviy/Jenkins-CI-CD.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Building Docker image"
                    docker build -t $IMAGE_NAME .
                '''
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

        // stage('Deploy to Nginx') {
        //     steps {
        //         sh '''
        //         echo "Deploying HTML to Nginx"
        //         sudo rm -rf /var/www/html/*
        //         sudo cp -r * /var/www/html/
        //         echo "Deployment done"
        //         '''
        //     }
        // }
    }
        post {
        success {
            echo " Application deployed successfully on Docker"
        }
        failure {
            echo " Pipeline failed"
        }
        always {
            echo "Pipeline finished"
        }
    }
}
