pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'csk1234/hello-world-python:1.0'
        DOCKERHUB_CREDENTIALS = 'my_dockerhub_credentials_id'  // Credential ID you created in Jenkins
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/chaitu-kale/jenkins_docker_python_helloworld.git'
            }
        }
        stage('Docker Build') {
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
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${env.DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${DOCKER_IMAGE}
                    '''
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
            echo 'Python application docker image built and pushed successfully.'
        }
        failure {
            echo 'Docker build, push, or run failed.'
        }
    }
}
 
