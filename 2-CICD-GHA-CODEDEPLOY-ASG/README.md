## CI/CD pipeline to deploy a Web App to Amazon EC2 (code Deploy +Gh actions + asg +ec2)

Developer commits code changes from their local repo to the GitHub repository. In this post, the GitHub action is triggered manually, but this can be automated.
GitHub action triggers the build stage.
GitHub’s Open ID Connector (OIDC) uses the tokens to authenticate to AWS and access resources.
GitHub action uploads the deployment artifacts to Amazon S3.
GitHub action invokes CodeDeploy.
CodeDeploy triggers the deployment to Amazon EC2 instances in an Autoscaling group.

# Infra using terraform to create asg and s3

# creating openIDconnect

go to iam and add oidc with url https://token.actions.githubusercontent.com
get tumbprint 
audience sts.amazonaws.com

add role with custom trust policy
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::YOUR_ACCOUNT_NUMBER:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:YOUR_GITHUB_USERNAME/YOUR_REPO_NAME:*"
                }
            }
        }
    ]
}

policy 
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::YOUR_BUCKET/*",
                "arn:aws:s3:::YOUR_BUCKET"
            ]
        }
    ]
}