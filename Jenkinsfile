pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hello-world-python:1.0'
    }
    stages {
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/chaitu-kale/jenkins_docker_python_helloworld.git'
            }
        }
        stage('Docker build') {
            steps {
                script {
                    if (fileExists('Dockerfile')) {
                        sh "docker build -t ${env.DOCKER_IMAGE} ."
                    } else {
                        error "Dockerfile not found in the workspace"
                    }
                }
            }
        }
        stage('Docker Run (optional)') {
            steps {
                sh "docker run --rm ${env.DOCKER_IMAGE}"
            }
        }
    }
    post {
        success {
            echo 'python application docker image build successfully.'
        }
        failure {
            echo 'docker build or run failed'
        }
    }
}
 
