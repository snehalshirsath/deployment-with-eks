pipeline {
    agent { label 'jenkins-pod' } //pod template label
    stages {
        stage('code checkout') {
	  steps {
	    git branch: 'deployment', 
	    credentialsId: 'bitbucket',
	    url: 'https://github.com/snehalshirsath/deployment-with-eks.git'
	  } 
	}
		    stage('deployment using helm chart') {
			    steps {
				sh '''
          cd deployment-with-eks/
          helm upgrade -i -f values.yaml machineinfo-v1 .
          '''
				}
				
			}			
			
	}
			
}
