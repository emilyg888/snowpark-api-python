---
marp: true
---
Draw the path: SQL query, external function, API integration, proxy, remote service.
Snowflake external function ENRICH_VEHICLE
-> API integration VEHICLE_API_INTEGRATION
-> AWS role api-integration
-> API Gateway u4eo9w8pia / prod
-> Lambda vehicle-enrichment

            snowflake env                                  AWS       remote service
client --> ENRICH_VEHICLE function --> API integration --> proxy --> lambda function
                                                        API_GATEWAY

Write the proposed input and output contract for ENRICH_VEHICLE.
input(scalar)
output(scalar)

List the security objects that would be required.
API integration

Decide whether a normal Python UDF would be enough.
A normal Python UDF is not enough when the logic must call a REST API or another external HTTP service. In that case, use a Snowflake external function, which routes the call through an API integration and a proxy service such as AWS API Gateway.

FULL EXTERNAL FUNCTION PATH:
Snowflake ENRICH_VEHICLE
-> API integration
-> AWS IAM role
-> API Gateway
-> Lambda
-> JSON result returned to Snowflake

AWS ROLE
arn:aws:iam::884692409741:role/api-integration
API_ID
u4eo9w8pia

create or replace api integration VEHICLE_API_INTEGRATION
  api_provider = aws_api_gateway
  api_aws_role_arn = 'arn:aws:iam::884692409741:role/api-integration'
  enabled = true
  api_allowed_prefixes = ('https://u4eo9w8pia.execute-api.ap-southeast-2.amazonaws.com/prod/');


  ENABLED	Boolean	true


API_AWS_IAM_USER_ARN	arn:aws:iam::640083578061:user/externalstages/cix16d0000
API_AWS_ROLE_ARN	arn:aws:iam::884692409741:role/api-integration
API_AWS_EXTERNAL_ID	LR79865_SFCRole=6_w5TcJQa8Wh/S10I9nomSidE3YpU=
API_ALLOWED_PREFIXES	https://u4eo9w8pia.execute-api.ap-southeast-2.amazonaws.com/prod/
API_BLOCKED_PREFIXES		


Trusted entities
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::640083578061:user/externalstages/cix16d0000"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "sts:ExternalId": "LR79865_SFCRole=6_w5TcJQa8Wh/S10I9nomSidE3YpU="
                }
            }
        }
    ]
}

Lambda proxy integration: ON
Response transfer mode: Buffered
Region: ap-southeast-2
Authorization: AWS IAM
Request validator: None
Integration timeout: 29000

API 
invoke URL: https://u4eo9w8pia.execute-api.ap-southeast-2.amazonaws.com/prod