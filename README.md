# Personal Project RPS
___
[About](#-about-)  
[Prerequisites](#-prerequisites-)  
[Usage](#-usage-)  
[Frameworks and Tools](#️-frameworks-and-tools-)  
## 🌐 About 🌐
---
** <sub> If you are new to DevOps or adjacent fields, and don't understand some of the terms or tools, please refer to </sub> [Frameworks and Tools](#frameworks-and-tools) 

This Rock Paper Scissors project is intended to demonstrate knowledge and implementation of Python, Docker, Terraform, and CI/CD (GitHub Actions). The actual use of this project is to host a simple Rock Paper Scissors game against a computer.
The project is able to be ran locally; the code has been containerized with Docker, accessible via a public image. 
If you want to host the game publically, the Terraform code provisions the resources as well as pulls the Docker image, as long as you have an AWS account; this will incur charges.
More features may be added in the future, both in the realm of game content, as well as DevOps tools.

## 📚 Prerequisites 📚
---
In order to run various parts of this project, you will need some tools, accounts, or other prerequisites. 
If you want to run this project locally, all you need to install is Docker.  
[Docker Installation](https://docs.docker.com/engine/install/)
If you want to run the Terraform code to host the game publically, you will need an AWS account, as well as Terraform installed. The AWS CLI allows you to interact with your AWS account through the command line, so that is necessary as well; you will need to configure it with your credentials for programmatic access.  
[Terraform Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  
[AWS Account Creation](https://aws.amazon.com/free/gclid=CjwKCAiA9IC6BhA3EiwAsbltOCfNuG34WyNDZDb2fXJjLn2NuxdAWLU5rcUFP6xqum8CGNS3bVp76xoC2_UQAvD_BwE&trk=78b916d7-7c94-4cab-98d9-0ce5e648dd5f&sc_channel=ps&ef_id=CjwKCAiA9IC6BhA3EiwAsbltOCfNuG34WyNDZDb2fXJjLn2NuxdAWLU5rcUFP6xqum8CGNS3bVp76xoC2_UQAvD_BwE:G:s&s_kwcid=AL!4422!3!432339156165!e!!g!!aws%20account!9572385111!102212379047&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)  
[AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  
[AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)  
Note that after creating an AWS account, charges may apply based on the resources you create and use. These charges depend on factors such as compute power, networking, memory, and storage, among others. I would not recommend running this game for long, and MAKE SURE YOUR RESOURCES ARE DESTROYED AFTER.  

## 🚀 Usage 🚀
---
** <sub> This usage section assumes you are on Linux. You will need to figure out how to use the command line commands for other systems. </sub>    
### Docker
To run this project locally, it can be done in one of three ways.  
The easiest is using Docker Compose. You will need to run these commands:
```
git clone https://github.com/danpuz7/personal-project-rps.git
cd personal-project-rps/pythondocker/
docker-compose up
```
If your terminal does not tell you to use Ctrl+C, or pressing Ctrl+C does not stop your container (the webpage is still working), you would typically run 
``` 
docker-compose down
```  
If you are learning Docker and want some practice doing a manual Docker build and run, you will run these commands:
``` 
git clone https://github.com/danpuz7/personal-project-rps.git
cd personal-project-rps/pythondocker/
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```
At this point, the game will be up and running. You can go to your browser and visit http://localhost:5000, and play Rock Paper Scissors against a computer.
To exit the container when you are done playing, press Ctrl+C. 
If your terminal does not tell you to use Ctrl+C, or pressing Ctrl+C does not stop your container (the webpage is still working), you would typically run ``` docker ps ``` to see the container ID, and then ``` docker stop < container_id > ```, replacing container_id with what is listed under CONTAINER ID or IMAGE. 

Alternatively, because the image is publically available in my Docker Hub repository, you can simply pull the pre-built image:
```
docker pull danpuz7/flask-app
docker run -p 5000:5000 danpuz7/flask-app
```
At this point, the game will be up and running. You can go to your browser and visit http://localhost:5000, and play Rock Paper Scissors against a computer.
To exit the container when you are done playing, press Ctrl+C. 
If your terminal does not tell you to use Ctrl+C, or pressing Ctrl+C does not stop your container (the webpage is still working), you would typically run ``` docker ps ``` to see the container ID, and then ``` docker stop < container_id > ```, replacing container_id with what is listed under CONTAINER ID or IMAGE.

### Terraform 
To provision the infrastructure, and at the same time pull the image from my Docker Hub repository and host the game publically, you can use Terraform. This will create the resources on your AWS account through a few simple commands:
```
git clone https://github.com/your-username/your-repo.git
cd your-repo
```
(If you performed the previous 2 commands, you do not need to again)
```
cd personal-project-rps/terraform/
terraform init
terraform plan
terraform apply
type "yes" 
```
This will create the resources on your account, in the region us-east-1, assuming you have completed the prerequisites. 
Your terminal will output the URL to the game. This URL can be accessed by anyone on the internet through HTTP, and they will be able to play the game. 
MAKE SURE TO DESTROY YOUR RESOURCES when you are done hosting it with the following command:
```
terraform destroy
type "yes
```
This will automatically remove the resources created on your AWS Account. You will no longer incur charges for the time spent with your resources provisioned.

## 🛠️ Frameworks and Tools 🛠️
---
__HTML Templates__ 🖥️  
HTML templates are pre-designed files that structure the content of a web page. They are like the blueprints for your website's layout. You can customize these templates with your own content, like text, images, and links, and they help make web pages look organized and easy to navigate.  
__Python 🐍__   
Python is a popular, easy-to-learn programming language. It’s great for beginners because it’s simple and readable. Python helps make your website "work" behind the scenes — like when someone submits a form or interacts with the page, Python is there doing the processing.  
__Flask 🌶️__    
Flask is a framework written in Python that helps you build web applications. It's like a toolset that makes it easier to create websites and APIs (the part of the website that talks to the database). Think of it as a helper that lets you quickly set up the structure of a web app, handle web requests, and display web pages.  
__Docker 🐳__  
Docker is a tool that helps developers create consistent environments for running their code. Imagine if you were moving into a new house — Docker packs up your code, along with everything it needs to run, and moves it into another computer without any problems. This is called containerization. It ensures your app works the same way no matter where it's running.  
__Docker Compose 🏗️__  
Docker Compose is a tool that helps you define and manage multi-container applications. In simple terms, if your project needs more than one Docker container (for example, one container for the web server and another for the database), Docker Compose helps tie them all together and run them at the same time. It’s like a manager that coordinates all the different parts of your app. This project does not need one currently, but may need one as more features are added.   
__Requirements File 📄__     
A requirements file is a simple text file that lists all the Python packages your project needs. It’s like a shopping list for all the libraries and tools that your project depends on. When someone else wants to run your project, they can use this list to quickly install everything they need to get it up and running.  
__Terraform File 🌍__      
Terraform is a tool used to set up and manage infrastructure (like servers and databases) in a repeatable way. It allows you to write a configuration file (called a Terraform file) that describes how to set up everything your project needs, such as a cloud server. Terraform will then automatically create, modify, and manage these resources, saving time and reducing errors.  