pipeline {
    agent { label 'kubepod' }
    stages {
        stage('Cloning') {
				  steps {
					  git branch: 'deployment', 
					  credentialsId: 'bitbucket',
					  url: 'https://github.com/snehalshirsath/deployment-with-eks.git'
				  }
		    }
		    stage('deployment using helm chart') {
			    steps {
				sh '''
          cd 
          helm install -f values.yaml machineinfo .
          '''
				}
				
			}			
			
	}
			
}
