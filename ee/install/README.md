# Installing Redis Enterprise
  
  ```
 wget https://s3.amazonaws.com/redis-enterprise-software-downloads/5.4.6/redislabs-5.4.6-18-xenial-amd64.tar
 tar xvf redislabs-5.4.6-18-xenial-amd64.tar
 ./install.sh
 ```
 
 ```
 2019-12-03 05:35:28 [.] Checking root access
2019-12-03 05:35:28 [!] Running as user root, sudo is not required.
2019-12-03 05:35:28 [.] Creating paths.sh
2019-12-03 05:35:28 [.] Creating socket directory /var/opt/redislabs/run 
2019-12-03 05:35:28 [.] Verifying that all required packages are installed
2019-12-03 05:35:29 [.] Deleting RedisLabs debug package if exist
2019-12-03 05:35:29 [.] Installing RedisLabs packages
2019-12-03 05:35:29 [$] executing: 'dpkg -i redislabs_5.4.6-18~xenial_amd64.deb redislabs-utils_5.4.6-18~xenial_amd64.deb'
(Reading database ... 71133 files and directories currently installed.)
Preparing to unpack redislabs_5.4.6-18~xenial_amd64.deb ...
Unpacking redislabs (5.4.6-18~xenial) ...
Preparing to unpack redislabs-utils_5.4.6-18~xenial_amd64.deb ...
Unpacking redislabs-utils (5.4.6-18~xenial) over (5.
```

```

Skipping test: verify_bootstrap_status
Skipping test: verify_processes
Running test: verify_dmcproxy
                PASS
Running test: verify_port_range
                PASS
Skipping test: verify_pidfiles
Running test: verify_capabilities
                PASS
Running test: verify_existing_sockets
                PASS
Running test: verify_host_settings
                PASS
Skipping test: verify_tcp_connectivity
Summary:
-------
ALL TESTS PASSED.
2019-12-03 05:36:07 [$] executing: 'chown redislabs:redislabs /var/opt/redislab
s/log/rlcheck.log'
2019-12-03 05:36:07 [!] Please logout and login again to make sure all environm
ent changes are applied.
2019-12-03 05:36:07 [!] Point your browser at the following URL to continue:
2019-12-03 05:36:08 [!] https://10.138.15.203:8443
2019-12-03 05:36:08 [$] executing: 'chmod 644 
/tmp/install.log'
2019-12-03 05:36:08 [$] executing: 'chown redislabs:redislabs /tmp/install.log'
ubuntu@ts-qualification-sa-ajeet-raina-2:~$ 
```

```
ubuntu@ts-qualification-sa-ajeet-raina-2:~$ curl 10.138.15.203:8443
<html>
<head><title>302 Found</title></head>
<body bgcolor="white">
<center><h1>302 Found</h1></center>
<hr><center>nginx</center>
</body>
</html>
```

You can browse at 

```
https://34.83.95.101:8443/
```




![My Image](https://github.com/collabnix/redistask/blob/master/image1.png)
![My Image](https://github.com/collabnix/redistask/blob/master/image2.png)
![My Image](https://github.com/collabnix/redistask/blob/master/image3.png)


 # Installing redis
 
 ```
 apt install python-pip
 pip install redis
 ```
 
Go to Redis Open Source CLI

Create a file named "script.py" and add the below content:

```
import redis
  
r = redis.Redis(
    host='10.138.15.202',
    port=6666,
    password='<password>')
i=1
while(i < 101):
    r.rpush('demolist', i)
    i += 1
#Print out the values from 1 - 100  
print(r.lrange('demolist', 0, -1))
```
 
```
ubuntu@ts-qualification-sa-ajeet-raina-1:~$ python script.py 
['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100']
