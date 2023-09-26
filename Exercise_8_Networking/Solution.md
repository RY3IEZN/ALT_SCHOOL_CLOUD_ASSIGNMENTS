<!-- @format -->

# IP Address 193.16.20.35 /29

Given the IP Address 193.16.20.35 /29

we are to provide the following

- Network IP
- number of hosts
- range of IP addresses
- broadcast IP

To find this we will use the following steps

- get the subnet mask
- get the host bits
- get the increment

with this we can now work on the solution

# 1. Get the subnet mask

From the IP address 193.16.20.35 /29, we can see the prefix is /29, which tell us that we have 29 on bit and 3 off bits. so first convert the prefix into binary form or bits

```
/29

in binary form would be

11111111.11111111.11111111.11111000
```

we can convert this back into normal digits or base 10, this becomes

```
11111111.11111111.11111111.11111000

becomes

255.255.255.248 #subnet mask

```

we now have our subnet mask 255.255.255.248

# 2. Get the Number of hosts

To get the number of host, we will use the host bits and to get the hosts bits we will use our subnet mask, So convert the subnet mask back to binary.

```
255.255.255.248

becomes

11111111.11111111.11111111.11111000
```

from our subnet mask we can see the available host bits in 0's, so to get the available host bit we use the formula to get the bits

```
2^# of hostbits
```

in this case we have 3 0's, so it will be

```
2³ = 8 #number of hosts
```

So we have 8 hosts or 8 available ips,

# 3. Range of address

Now that we have the host bits, we can now use it as the increament and we can get the range of the ip address. since we know the 1st 3 octets are locked, we can start from 0 and add the incremnt until we get the desired range

```
193.16.20.0-7
193.16.20.8-15
...
...
193.16.20.32-39 #the ip is within this range
...
...
```

therefore the range of the ip address is

193.16.20.32-193.16.20.39

# 4. Network and broadcast ip

Now that we have our range of ip address, we can determine our network and broadcast ip, which is usally the 1st and the last host in the ip address,
in this case we have the range of 193.16.20.32-193.16.20.39

```
193.16.20.32 #Network IP
193.16.20.33
193.16.20.34
193.16.20.35
193.16.20.36
193.16.20.37
193.16.20.38
193.16.20.39 #Broadcast IP
```

So in this case our

- network ip is 193.16.20.32
- broadcast ip is 193.16.20.39

# Summary

In Summary here are all the details we have

- ip address -> 193.16.20.35
- network ip -> 193.16.20.32
- broadcast ip -> 193.16.20.39
- number of hosts -> 8
- range of IP addresses -> 193.16.20.32-193.16.20.39

for bonus points

- subnet mask -> 255.255.255.248
- number of host -> 8
- available ip -> 8
- useable ip -> 6
