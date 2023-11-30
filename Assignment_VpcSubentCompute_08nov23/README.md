<!-- @format -->

# VPC With public and private subnets and an EC2

![alt](images/vpcsubec2.png)

# A. Create the netowrking infrastructure.

We are going to create the network infrastructure and we are going to create a vpc and subnet to host our infrastructure, we may need an s3_endpoint as we are going to keep all infrastrucure in a private network

We will create each network resource seperately.

So lets get to it.. sign in to the EC2 console and search for VPC and navigate to the dashboard

![alt](images/altvpc1.png)

On the dashboard select "Create VPC" and then follow the prompt

![alt](images/altvpc2.png)

Select VPC only

![alt](images/vpca1.png)

We are going to use a VPC CIDR of 10.0.0.0/16 while leaving no ipv6 cidr

![alt](images/vpca2.png)

fill in the tags and then click create vpc.

![alt](images/vpca2.png)

Next we can move to subnets on the panel on the left

![alt](images/subnet1.png)

select the vpc you newly created and leave the availablity zone preference to no preference

![alt](images/subnet2.png)

we have to set the subnet to the a network within the vpc network, so for the public subnet we will use 10.0.4.0/24 and 10.0.3.0/24 for the private subnet

![alt](images/subnet3.png)

Once its done, we now have to subnet

![alt](images/subnet4.png)

# B. Create the Virtual Machines (EC2)

Now that we have the networking infrastructure in place we can go ahead and create the infrastructure, we are going to create 2 vms and place each of them in to each subnet.

Sign into the console and search for EC2 and navigate to the dashboard

![alt](images/ec21.png)

Head over to the EC2 dashboard and click on "launch instances"

![alt](images/ec22.png)

You can give your VM a names and select an OS type, for this demo we will be using ubuntu

![alt](images/ec23.png)

from here ensure to select the desired architecure and configure the size and capacity of your virtual machine

For the purpose of this demo, kindly use t2.micro,if you are new you should still be legible for the cost to be covered by free tier

![alt](images/ec24.png)

and then generate and download a new key pair and store is securely

![alt](images/ec25.png)

Now for the networking part, make sure to click edit and select the newly created VPC and also for the subnet ensure to place it in the newly created vpc, 1 private and 1 in public subnet lastly disable auto assign public ip while leaving the firewalls as default

![alt](images/ec26.png)

We will update the security rules later, as for storage leave as default for now. then click launch instance

![alt](images/ec27.png)

Onces that done we should have our virtual machine ready to go, You can repeat the same steps above and place other vms in each subnet or according to specifications

![alt](images/ec28.png)

### Create Rule in the security groups

Before we procced to connecting to our vms, we need to add a rule to the security group so that both vms can accept icmp pings, Go to the ec2 dashboard and click on "security groups" on the panel on the left, select the group id and click actions > "edit inbound rules"

![alt](images/sg1.png)

Click on add rule, set as follows,

1. Type: All ICMP - Ipv4
1. Source: Anywhere - Ipv4

then click save, repeat same steps for the other security group

![alt](images/sg2.png)

NB:The source destination should not be anyhwere(0.0.0.0/0) for security reasons, rather it would be your current ip or specific ip address. but for the sake of this demo.. we can leave it as that "0.0.0.0/0"

# C. Connect and ping each VM

### Test Connectivity between vms

Now that the vms have been created, we can now connect to them using the endpoint link that we created, so go to the ec2 dashboard, select a vm and click on connect

![alt](images/connect1.png)

Most of the values are already filled in, simply select the "connect using...endpoint", select the actual endpoint and then click connect

![alt](images/connect2.png)

Another browser window should open up and a view of a terminal into your vm. Great we are in.

![alt](images/connect3.png)

To test that we can communicate to the both vm from each other, we can use the ping command to test

```sh
:~$ ping <VM_PRIVATE_IP_ADDRESS>
```

From the 1st vm we can succesfully ping the other vm, we also ping from the other vm too.

![alt](images/success1.png)

Also we can ping the previous vm from the second vm

![alt](images/success2.png)

With this we are now sure that both vms can communicate with each other via the private ip addresses assigned to them.

Enjoy!!!

🚧🚧🚧Dont forget to delete all your resources when you are done!🚧🚧🚧
