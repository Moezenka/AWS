AMI=$(aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????-x86_64-gp2' 'Name=state,Values=available' --output json | jq -r '.Images | sort_by(.CreationDate) | last(.[]).ImageId')

SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=Cloud9-SSH-HTTP/EUWEST --output json | jq -r '.[] | .[] | .GroupId')

SUBNET=$(aws ec2 describe-subnets --filters Name=availability-zone,Values=eu-west-1a --output json | jq -r '.[] | .[] | .SubnetId')

INSTANCETYPE=$(aws ec2 describe-instances --filters Name=instance-type,Values=t2.micro --output json | jq -r '.Reservations[0].Instances[0].InstanceType')

KEY=$(aws ec2 describe-key-pairs --filters Name=key-name,Values=MyLoginKey --output json | jq -r '.KeyPairs[0].KeyName')

TAG=ResourceType=instance,Tags=[{Key=Name,Value=LAB-Nginx}]

BASHSCRIPT="file:///home/ec2-user/environment/Scripts/install-nginx.sh"

aws ec2 run-instances --image-id $AMI --count 2 --instance-type $INSTANCETYPE --key-name $KEY --security-group-ids $SG --subnet-id $SUBNET --user-data $BASHSCRIPT --tag-specifications $TAG
