#!/bin/sh
export AWS_DEFAULT_PROFILE=dwest
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
export AWS_DEFAULT_REGION=$(aws configure get region)
export SWAPEX_ENVIRONMENT=dwest
export SWAPEX_PARALLELISM=100
