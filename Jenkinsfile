pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://repo-dev.efi-academy.com/arezkiguezout/myapp_j2e_learning.git'
            }
        }
        stage('Build') {
            steps {
                withMaven(jdk: 'java', maven: 'maven', traceability: true) {
                    sh 'mvn clean install package'
                }
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat_credentials', path: '', url: 'http://192.168.1.148:8080')], contextPath: null, war: '**/*.war'
            }
        }
    }
}