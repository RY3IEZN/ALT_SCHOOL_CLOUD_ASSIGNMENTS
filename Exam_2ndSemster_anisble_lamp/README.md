<!-- @format -->

## Prerequisites

1. A PC or laptop with any OS installed(preferrably linux).
1. About 6gb of RAM or more (the more the better&&faster)
1. An Internet connection.
1. A compatible hypervisor installed eg. Virtualbox,VMware, hyper-v.
1. Vagrant installed.
1. Ansible
1. A code editor of your choice, in this case Vscode.

To set up this infrastructure, you can simply just use 1 command `vagrant up` and it will automatically provision and configure the master and slave nodes, leaving the slave node clean

```
:~$ vagrant up
```

# 1. Master Node

First of all, we are going to create a master node, which will serve as the control plane

From our vagrant file under the master section,we have some bash scripts to automate the setup

The bash script is to create a user and to superuser group ./create_user.sh, the next is to install the lamp stack ./lamp_stack.sh

# C. Use Ansible to deploy script on Slave node

For this section we are going to use Ansible to execute the bash script and also use it to test the availablity and accessibility of the website, It will also create a cron job for us.

After you clone this repo, ensure you have ansible on the host/control node, save keys and update the host files. then you can run the ansible playbook `slave_config.yaml`, using the `ansible-playbook` command

```
:~$ ansible-playbook slave_config.yaml
```

While the ansible script is being executed you can check the logs, we should see a status code of 200, which means the site is available and reachable

![alt](/images/ansible1.png)

as you can see we used ansible to check its accessibility and also you can visit the site using the VM_IP in your browser

![alt](/images/ansible2.png)

we can also confirm the cronJob is set by checking the cronjobs list

```
:~$ sudo crontab -e
```

the outcome should like this

![alt](/images/ansible3.JPG)

In this way the project is complete but only accessible through localhost for now.

Enjoy!!!
