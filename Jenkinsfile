properties([
	parameters([
		string(description: 'Enter InstanceIDs', name: 'instances', trim: false),
        string(description: 'Enter AWS accesskey', name: 'accesskey', trim: false),
		string(description: 'Enter secretkey', name: 'secretkey', trim: false),
		string(defaultValue: 'ap-south-1', description: 'Enter region name', name: 'region', trim: false)
    ])
])
 
pipeline {
    agent {label 'master'} 
    stages  {
        stage('Clean workspace'){
            steps {
                cleanWs()
            }
        }
		
        stage ('git clone ')
   		 {
            steps{
	            echo "In scm stage"
	            git url: 'https://github.com/hitechvenkadesh/jenkscripts.git'
            }
        }
    
		stage ('python code executor-1 test file') {
			steps{
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					
					ls
					
					python3 sample.py
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('python code executor-2 Starting Client') {
			steps{
				
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					ls
					
					python3 ec2startjenkins.py ${region} ${accesskey} ${secretkey} ${instances}
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('python code executor-3 Instance detail') {
			steps{
				
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					
					ls
					
					python3 listec2jenkins.py ${region} ${accesskey} ${secretkey}
				   
				'''
			} // end of steps
		} //end of stage
  }
}
