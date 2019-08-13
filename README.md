SO1-Challenge
===
# Prerequisites:

Make sure you have installed and configured these in your test machine:
1. Git
2. Docker
3. Kubectl
4. curl
5. Java and JDK 8
6. Maven

# Installation:

## TASK 1:
As I am not familiar with Nagios, I would use a simple shell sript to monitor the file using `cat` and `grep` for the string `Handbill not printed`.

To run the script use the following command:

    git clone https://github.com/arathdeepak/SO1-test.git
    /bin/bash ./ES-logMonitoring/Es-monitor.sh 

This can be run as a cron or we could even use the value output as an input to `Zabbix` or other monitoring tool to trigger an alert depending on the criticality.
    

## Task 3:
- Clone git repository to the local machine:

    pwd
    git clone https://github.com/TechPrimers/docker-mysql-spring-boot-example.git  && cd docker-mysql-spring-boot-example
    ./mvnw clean package
    docker build . -t users-mysql

Start the kubernetes pods

    git clone https://github.com/arathdeepak/SO1-test.git
    cd deployments
    kubectl apply -f mysql-pv.yaml
    kubectl apply -f mysql-deploy.yaml
    kubectl apply -f so-app-deploy.yaml

- Following commands does the following:

`kubectl apply -f mysql-pv.yaml`  ## Initializes a persistent storage for MysqlDB

`kubectl apply -f mysql-deploy.yaml` ## Starts Mysql instance

`kubectl apply -f so-app-deploy.yaml`  ## Deploys Spring boot code to 2 pods with HTTP custom health check for policy based auto-heal.

#### TASK 3 - 6. Add CI to the deployment process

- A `Jenkins` needs to be setup and deployment need sto be automated with Jenkins.
- We can use `Git Hooks` from git repository to monitor the changes and depenind on that build and deployments can be triggered.

#### TASK 3 - 7. Split your deployment into prd/qa/dev environment.

- DEV/QA/PRD environments can be addressed with different tag names in git using `Jenkins`.

Example: DEV tag can have a value: `arathdeepak/users-mysql:dev`, once its promoted to QA TAG name will get changed to QA and then to PRD. Depenind on the TAG associated with the git branch, we can set up `Jenkins` to trigger deployments and post deployment tasks to each environments. For example, if we are deploying for QA, we can add post build jobs for autamated test cases like, smoke test, etc.

#### TASK 3 - 8. Please suggest a monitoring solution for your system. How would you notify an admin that the resources are scarce?

- `Zabbix` can be installed and used as a monitoring tool.

With Zabbix, we can monitor the resources such as CPU, Memory, IO, etc. And on top of that we can configure custom monitors to monitor Application load, resource utilization, errors or messages inside log files, etc.

Alerting can be configured like, phone calls (Using twelio), SMS, Mail, Slack channel alerts, etc.
