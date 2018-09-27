pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            } 
        }
        stage('Deploy') {
            steps {
              sh 'curl -X POST https://registry.hub.docker.com/u/cutec/promet-server-alpine-docker/trigger/a7020c4b-fa2e-4528-8451-d9456f76175a/'
            }
        }
    }
    post {
        failure {
            mail to: 'jenkins@chris.ullihome.de',
                 subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                 body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                 <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>"""
        }       
    }
}
