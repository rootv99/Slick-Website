pipeline {
  environment {
    registry = "rootv/slick-website"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/rootv99/Slick-Website.git'
      }
    }
    stage('Build Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Deploy Helm Charts') {
      steps {
        sh 'helm upgrade --install --wait helmcharts ./helmcharts/'
      }
    }
  }
}
