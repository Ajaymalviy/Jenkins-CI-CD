pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:Ajaymalviy/Jenkins-CI-CD.git'
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh '''
                echo "Deploying HTML to Nginx"
                sudo rm -rf /var/www/html/*
                sudo cp -r * /var/www/html/
                echo "Deployment done"
                '''
            }
        }
    }
}
