#!/usr/bin/env bash

GROUP_ARN='arn:aws:elasticloadbalancing:us-west-2::targetgroup/NAME/ID'
REGION='us-west-2'
TIME=$(date +"%Y%m%d_%H%M%S")
KEY_PATH='id_rsa'

server_log='/home/ubuntu/error-logfile.log'
directory=${TIME}
mkdir ${directory}

describe_target_cmd="aws elbv2 describe-target-health --target-group-arn ${GROUP_ARN} --region ${REGION}"
targer_py_parser="import json, sys; print(' '.join([item['Target']['Id'] for item in json.load(sys.stdin)['TargetHealthDescriptions']]))"
instances=$(eval "${describe_target_cmd}" | python3 -c "${targer_py_parser}")

ec2_py_parser="import json, sys; print(json.load(sys.stdin)['Reservations'][-1]['Instances'][-1]['PublicIpAddress'])"
for instance in ${instances}
do
    describe_ec2_cmd="aws ec2 describe-instances --instance-ids ${instance} --region ${REGION}"
    ip=$(eval "${describe_ec2_cmd}" | python3 -c "${ec2_py_parser}")
    echo ${ip}
    scp -o StrictHostKeyChecking=no -i ${KEY_PATH} ubuntu@${ip}:${server_log} ${directory}/${ip}.${server_log##*/}
done
