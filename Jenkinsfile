node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
  
       app = docker.build("pushpamu/project_pyramidci")
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
