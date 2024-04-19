import boto3
ec2 = boto3.client('ec2')
# create a vpc and return vpc id
response = ec2.create_vpc(
    CidrBlock='10.0.0.0/16',
    TagSpecifications=[
        {
            'ResourceType': 'vpc',
            'Tags': [
                {
                    'Key': 'Name',
                    'Value': 'from-code'
                }
            ]
        }
    ]
    )
print(response['Vpc']['VpcId'])
# create a subnet and return subnet id
ec2.create_subnet(VpcId = response['Vpc']['VpcId'], CidrBlock = '10.0.1.0/24')
      



