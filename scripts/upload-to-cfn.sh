#! /bin/bash

aws s3 cp . s3://cmidev/ --recursive
aws cloudformation update-stack --stack-name website \
    --template-body file://cloudformation/website-master.yml \
    --parameters file://cloudformation/website-master.parameters.json
aws cloudformation wait stack-update-complete --stack-name website
echo "success"