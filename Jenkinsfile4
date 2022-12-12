pipeline {
    agent {label 'boto3slave'} 
    stages  {
        stage('Clean workspace'){
            steps {
                cleanWs()
            }
        }
    
		stage ('Build') {
			steps{
	  
				sh'''
					
					echo "The stage is building"
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('Test') {
			steps{
				
				sh'''
					
					echo "The stage is Testing"	
				   
				'''
			} // end of steps
		} //end of stage

        stage ('Deploy') {
			steps{
				
				sh'''
					
					echo "The stage is Deploying"	
				   
				'''
			} // end of steps
		} //end of stage
		
	}

}
