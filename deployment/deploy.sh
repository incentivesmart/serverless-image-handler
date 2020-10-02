#!/bin/bash

REGION=eu-west-2
DIST_OUTPUT_BUCKET=build-tools.incentivesmart.com
SOLUTION_NAME=ib-sih
VERSION=1.0.0

./build-s3-dist.sh $DIST_OUTPUT_BUCKET $SOLUTION_NAME $VERSION

echo $DIST_OUTPUT_BUCKET-$REGION/

aws s3 sync ./regional-s3-assets/ s3://$DIST_OUTPUT_BUCKET-$REGION/$SOLUTION_NAME/$VERSION/ --acl bucket-owner-full-control
aws s3 sync ./global-s3-assets/ s3://$DIST_OUTPUT_BUCKET-$REGION/$SOLUTION_NAME/$VERSION/ --acl bucket-owner-full-control
