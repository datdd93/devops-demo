pipeline {
    agent any

    parameters {
        choice(name: 'DEPLOYMENT_ENV', choices: ['dev', 'staging', 'prod'], description: 'Deployment environment')
        string(name: 'PROJECT_DIR', defaultValue: 'python-backend-app', description: 'Project directory')
        string(name: 'CUSTOM_TAG', defaultValue: '', description: 'Custom image tag')
    }

    environment {
        REGISTRY = 'ducdat2411'
        IMAGE_NAME = 'python-backend-app'

        GIT_URL = "git@github.com:datdd93/devops-demo.git"
        GIT_BRANCH = "main"
        GIT_CREDENTIAL = "jenkins"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                sh "git clone -b ${env.GIT_BRANCH} ${env.GIT_URL}"
            }
        }

        stage('Docker build') {
            steps {
                script {
                    dir ("${params.PROJECT_DIR}") {
                        sh "docker build -t ${env.REGISTRY}/${env.IMAGE_NAME}:${params.CUSTOM_TAG} ."
                    }
                }
            }
        }

        stage('Unit test') {
            steps {
                script {
                    echo 'Running unit tests...'
                }
            }
        }

        stage('Tag and Push Image') {
            steps {
                script {
                    echo "Pushing image to registry... ${env.DEPLOYMENT_ENV}"
                    sh "docker push ${env.REGISTRY}/${env.IMAGE_NAME}:${params.CUSTOM_TAG}"
                }
            }
        }
    }
}