import boto3

listec2 = boto3.client('ec2',region_name='us-east-1',
	aws_access_key_id='AKIAJQYWTAVFIEOVUMHQ',
	aws_secret_access_key='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')

output = listec2.describe_instances()
for printid in output['Reservations']:
    for printid2 in printid['Instances']:
        for printid3 in printid2['Tags']:
            print((printid2['InstanceId']),
                  (printid2['InstanceType']),
                  (printid2['LaunchTime']),
                  (printid2['State']['Name']),
                  (printid3['Value']))
