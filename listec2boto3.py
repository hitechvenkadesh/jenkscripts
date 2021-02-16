import boto3

listec2 = boto3.client('ec2',region_name='ap-south-1',
	aws_access_key_id='AKIAJDSGKXYA5YT7A4TA',
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
