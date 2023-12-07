<!-- @format -->

# Holiday Project

## ALB balancing traffic to 2 or more webserver

<div style="display: flex; justify-content: space-between;">
    <img src="./images/Azure holiday Project.png"  alt="Image 1" width="
    50%">
    <img src="./images/aws_holiday_project.png"  alt="Image 2" width="49%">
</div>

## Prerequisites

1. An Aws Account

Create vpc
create empty target group
create autoscaling group, (create launch template 1st, then later add to traget group)
create loadbalncer
simulate asg taking action

# E. Simulate Auto-scaling taking action

I knows it been long read, for the last part we are going to test out a simulation of an autoscaling group.

Usually when an instance is unhealthy or not responding,a new instance replaces the faulty one, so to simulate this we will go to the EC2 dashboard and terminate one of the instances

![alt](images/sim1.png)

Once we terminate the instance the loadbalancer will continue to perform its health checks periodically, once it notices that an instance is unhealthy. it will notify the ASG and get another instance to replace it

![alt](images/sim2.png)

we can now see another instance will be brought up to replace the previously terminated one.

![alt](images/sim3.png)

Great, we have succesfully simulated an asg taking action in response to a failed/unhealthy instance

Enjoy!!!

🚧🚧🚧Dont forget to delete all your resources when you are done!🚧🚧🚧
