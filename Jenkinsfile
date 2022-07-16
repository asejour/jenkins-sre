pipeline {
    agent any
    
    environment {
        
        registry = "143527018359.dkr.ecr.us-east-1.amazonaws.com/my-app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/asejour/genspark-sre-training/']]])
            }
        }
        
        stage('build image') {
            steps{
                script{
                    docker.build registry
                }
            }
            
        }
        
        stage('test') {
            
            steps{
                
                echo "Ok continue---Emppty"
            }
            
        }
        
        stage('Push Docker image to ecr') {
            steps{
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 143527018359.dkr.ecr.us-east-1.amazonaws.com"
                sh "push 143527018359.dkr.ecr.us-east-1.amazonaws.com/my-app:latest"
                
            }
        }
        stage('Kubernetes Deploy'){
            
            steps{
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8-konfig', namespace: '', serverUrl: '') {
                sh "kubectl apply -f deployment.yaml"
                }
            }
        }
    }
}
