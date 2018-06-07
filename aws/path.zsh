#!/bin/sh
export AWS_DEFAULT_PROFILE=dwest
export AWS_PROFILE=dwest
export SWAPEX_ENVIRONMENT=dwest
export AWS_ACCOUNT_ID=$(aws configure get aws_account_id) \
DWEST_ACCOUNT_ID=$(aws configure get aws_account_id) \
AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id) \
AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key) \
AWS_DEFAULT_REGION=$(aws configure get region)

function assume_role() {
  target_account_id=$1
  role_name=$2
  echo "MFA token: "
  read token
  tmp_json=$(aws sts assume-role --serial-number arn:aws:iam::${DWEST_ACCOUNT_ID}:mfa/dwest --role-arn arn:aws:iam::$target_account_id:role/$role_name --role-session-name 'RoleSession1' --profile default --token-code $token)
  ec=$?; if [[ $ec == 0 ]]; then
    export AWS_ACCESS_KEY_ID=$(echo $tmp_json | jq --raw-output '.Credentials.AccessKeyId')
    export AWS_SECRET_ACCESS_KEY=$(echo $tmp_json | jq --raw-output '.Credentials.SecretAccessKey')
    export AWS_SESSION_TOKEN=$(echo $tmp_json | jq --raw-output '.Credentials.SessionToken')
  else
    echo "something went wrong assuming role"
  fi
}

function aa() {
  assume_role $AWS_ACCOUNT_ID jit_admin_0
}
