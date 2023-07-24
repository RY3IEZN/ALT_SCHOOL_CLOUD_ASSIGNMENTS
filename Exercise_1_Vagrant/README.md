<!-- @format -->

# Exercise 1 - Set up vagrant

Task: Setup Ubuntu 20.04 LTS on your local machine using Vagrant

Instruction:
Customize your Vagrantfile as necessary with private_network set to dhcp
Once the machine is up, run ifconfig and share the output in your submission along with your Vagrantfile in a folder for this exercise.

# Solution

Before we proceed please ensure you a hypervisor compatible with vagrant, an example of such is virtualbox or VMware etc.

Step 1:

Go to the offical Vagrant Website and download the installer and download the appropriate binary/installer for your operating system.

step 2:

Once the installation is done, to keep things neat and orderly, create a folder and then open a terminal in that folder.. we will keep all our files in 1 location

step 3:

In a terminal run the intial vagrant command to generate the files needed for vagrant to run

```
vagrant init <os/version>
```

step 4:

once the files are generated, you can do further configuration on the vagrant file,

step 5:

You can now run the command to spin up a vm using the hypervisor of your choice.

```
vagrant up
```

after a few mintues, another window with your guest os should pop up and you login with your credentials, the default is userid/password is vagrant/vagrant

NB:dont forget to change the password

step 6:

run the ifconfig command to display some of the networking details of your Vm

```
ifconfig
```

With that you succefully finished setting up vagrant, set up a vm and also seen the network details of your vm.
