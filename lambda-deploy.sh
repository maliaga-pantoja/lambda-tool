# /usr/bin/bash
# VARS
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
# FN_NAME -> fn name: like my-function
# ROLE_ARN -> role arn created in aws console
# HANDLER -> handler in format <file_name>.<method> : index.handler
# PUBLISH -> boolean

docker run --name lambda-upload-nodejs --rm \
-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
-e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
-v $PWD:/app -w /app amazon/aws-cli:latest \
lambda create-function --function-name $FN_NAME \
--runtime nodejs10.x --role $ROLE_ARN \
--handler $HANDLER \
--zip-file fileb://build.zip \
--environment Variables={KeyName1=string,KeyName2=string} \
--description 'no description' \
--timeout 5 --memory-size 128 --publish $PUBLISH