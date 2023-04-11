properties([
	parameters([
		string(defaultValue: '254fc39b-c667-436b-80a7-f0dc7038e484', description: 'Enter SubscriptionID', name: 'subscription_id', trim: false),
        string(description: 'Enter client_id', name: 'client_id', trim: false),
		string(description: 'Enter client_secret', name: 'client_secret', trim: false),
		string(defaultValue: 'c4ee9917-7207-4268-aafe-ef8a9ed9f230', description: 'Enter tenant_id', name: 'tenant_id', trim: false)
    ])
])

pipeline {
    agent {label 'terraform'} 
    stages  {
        stage('Clean workspace'){
            steps {
                cleanWs()
            }
        }
		
        stage ('git clone')
   		 {
            steps{
				sh'''
					echo "${WORKSPACE}"
					
					git clone https://github.com/hitechvenkadesh/terra.git
					pwd
					ls
				
				'''
            }
        }
    
		stage ('terraform init') {
			steps{
	  
				sh'''
					
					echo "${WORKSPACE}/terra"
          ls
					terraform init
				   
				'''
			} // end of steps
		} //end of stage
		
		stage ('terraform plan') {
			steps{		
	  
				sh'''
					
					echo "${WORKSPACE}/terra"
					
					terraform plan -var "subscription_id=${subscription_id}" -var "client_id=${client_id}" -var "client_secret=${client_secret}" -var "tenant_id=${tenant_id}"
					
				'''
			} // end of steps
		} //end of stage
		
		stage ('terraform apply') {
			steps{
	  
				sh'''
					
					echo "${WORKSPACE}/terra"
					
					terraform apply --auto-approve -var "subscription_id=${subscription_id}" -var "client_id=${client_id}" -var "client_secret=${client_secret}" -var "tenant_id=${tenant_id}"
				   
				'''
			} // end of steps
		} //end of stage
	}
}
