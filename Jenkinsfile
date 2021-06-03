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
    
    stage('Email Notification') {
        mail bcc: '', body: '''Welcome to Jenkins email alerts
        Thanks
        Pushpa''', cc: '', from: 'pushpa.munagala@pyramidci.com', replyTo: '', subject: 'Jenkins Job', to: 'pushpa.munagala@pyramidci.com'
    }
}
