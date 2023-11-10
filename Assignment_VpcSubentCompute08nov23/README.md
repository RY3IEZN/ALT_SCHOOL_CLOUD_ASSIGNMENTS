<!-- @format -->

# VPC With public and private subnets and an EC2

![alt](images/vpcsubec2.png)

# A. Create the netowrking infrastrucute

# B. Create the Virtual Machines (EC2)

### Create Rule in the security groups

Before we procced to connecting to our vms, we need to add a rule to the security group so that both vms can accept icmp pings, Go to the ec2 dashboard and click on "security groups" on the panel on the left, select the group id and click actions > "edit inbound rules"

![alt](images/sg1.png)

Click on add rule, set as follows,

1. Type: All ICMP - Ipv4
1. Source: Anywhere - Ipv4

then click save

![alt](images/sg2.png)

NB:The source destination should not be anyhwere(0.0.0.0/0) for security reasons, rather it would be your current ip or specific ip address. but for the sake of this demo.. we can leave it as that "0.0.0.0/0"

# E. Connect and ping each VM

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
