import boto3
import sys

region=sys.argv[1]
access_key=sys.argv[2]
secret_key=sys.argv[3]
instances=sys.argv[4].split(",")

ec2 = boto3.client('ec2',region_name=region,
	aws_access_key_id=access_key,
	aws_secret_access_key=secret_key)

def startec2():
    ec2.start_instances(InstanceIds=instances)

startec2()