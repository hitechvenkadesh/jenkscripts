properties([
	parameters([
		string(defaultValue: '5cf911d9-f203-4d74-b253-c55ac4561656', description: 'Enter SubscriptionID', name: 'subscription_id', trim: false),
		string(description: 'Enter client_id', name: 'client_id', trim: false),
		string(description: 'Enter client_secret', name: 'client_secret', trim: false),
		string(defaultValue: '1c8dc502-073c-43fb-864e-10f11ff2cf35', description: 'Enter tenant_id', name: 'tenant_id', trim: false)
    ])
])
 
pipeline {
    agent {label 'Master'} 
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
	            git clone 'https://github.com/hitechvenkadesh/terra.git'
            }
        }
    
	stage ('terraform init') {
			steps{
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					
					ls
					
					terraform init
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('terraform plan') {
			steps{
				
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					ls
					
					terraform plan -var "subscription_id=${subscription_id}" -var "client_id=${client_id}" -var "client_secret=${client_secret}" -var "tenant_id=${tenant_id}"
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('terraform apply') {
			steps{
				
	  
				sh'''
					
					echo "${WORKSPACE}"
					
					
					ls
					
					terraform apply -auto-approve -var "subscription_id=${subscription_id}" -var "client_id=${client_id}" -var "client_secret=${client_secret}" -var "tenant_id=${tenant_id}"
				   
				'''
			} // end of steps
		} //end of stage
  }
}
