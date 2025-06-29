Objective:
Deploy a containerized web application using ECS Fargate, with Auto Scaling, CI/CD pipeline, and CloudWatch monitoring. This project simulates a production-ready deployment environment.
Architecture Overview:
GitHub → Code Pipeline → Code Build
                                                       ↓
                                     Docker image built
                                                       ↓
                                    ECS Fargate (with ALB)
                                                      ↓
                            Auto Scaling based on CPU load
                                                      ↓
           Monitoring via CloudWatch Dashboards + Alarms
Services Used:
	• ECS Fargate – Serverless container hosting
	• Elastic Load Balancer (ALB) – Distribute traffic
	• Code Pipeline + Code Build – CI/CD automation
	• CloudWatch – Logs, dashboards, and alarms
	• ECR – Container registry
	• IAM – Permissions and roles
	
Step-by-Step Implementation

Step 1: Preparing Web App
For this project we will use node.js default web app that can be downloaded using the following commands 

npx create-react-app (name)

This is the demonstration on how to use this on thew terminal 

Step 2: Creating Docker file
This is the code  for docker file that will be used to make the docker image
FROM node 
WORKDIR /myapp
COPY . . 
RUN npm install 
EXPOSE 3000
CMD ["npm","start"]


Step 3: Removing node modules


 
As we have specified in the docker file that we will install the node modules using the npm install command so to reduce the size of the image we removed it.

 Step 4: Creating Buildspec.yml




 Step 5: Push App to GitHub 


Step 6: Create a docker image

 
Step 7: Create a Repository on AWS ECR 

 

Step 8: Push the image to ECR 



Step 8: Creating target Group for Application Load Balancer



Step 9: Create Security Group for Application Load Balancer





We have set inbound rule so that the traffic can come from ECS

 Step 10: Creating an Application Load Balancer: 



 Step 11: Create ECS Cluster


 Step 12: Creating Task Definition


 
Step 13: Creating a service for Cluster



Step 14: Check If the ALB is routing Traffic


Step 15: Building a Code Pipeline on AWS 
 
Step 16: Testing the project   
We will change the code from GitHub


Now we see if the app have changed 


![image](https://github.com/user-attachments/assets/ef861670-4bb4-41e5-a33b-8e2ade00c33d)
