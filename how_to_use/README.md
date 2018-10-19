## Login 
* Open a web browser and enter the IP address of your host: `https://192.200.10.100`
* When prompted, create a password for the default `admin/admin`

## Set the Rancher Server URL
 The URL can either be an IP address or a host name, but in this case write vagrant rancher server IP
![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/saveURL.png?raw=true)

## Add Cluster
Add Cluster is the task of adding a kubernetes worker server to be processed by rancher.
* Choose Custom
* Enter a cluster name as you have deployed vagrant worker server easy to recognize like `vmhost01`
* Skip Member Roles and Cluster Options.  
![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/addcluster.png?raw=true)

* select all the roles: etcd, Control, and Worker
* Public Addres : `192.200.10.11 ~ 192.200.10.1x`, ex> vmhost01 -> 192.200.10.11 / vmhost02 -> 192.200.10.12
* private Address : let's find in VM, ifconfig
![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/make_add_cluster_script.png?raw=true) 

* Click script copy button and excute in the vagrant worker server
```shell
vagrant ssh vmhost01
sudo -i 
$ PASTE MAKING SCRIPT HERE 
```
* Then, click `Done`


###  Workloads Deploy Example 
Workloads Deploy is deploying pods container and making service discovery to worker server  
* In this example, we will deploy a simple download queue web server in docker-hub[youtube-dl-nas](https://hub.docker.com/r/modenaf360/youtube-dl-nas/)

* Select cluster worker server & namespace: `Cluster:worker01 > Default`
* Click button `Workloads > Deploy`
* insert below variables : Name, Docker image, Container using port

 |info        |Description                                                   |
 |-----------------|--------------------------------------------------------------|
 |`Name`|`Anything`                                       |  
 |`Docker Images`| `modenaf360/youtube-dl-nas`                                           |
 |`Publish the container port`| `8080`                                           |

 ![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/deploystep1.png?raw=true)

 * insert Environment variables  : this variable apply when container provisioning. 
 ![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/deploystep2.png?raw=true)
 * Volumes 
 
  |info        |Description                                                   |
   |-----------------|--------------------------------------------------------------|
   |`Path on the Node`|`/vagrant/~~`  /vagrant/~ folder pass throw to the host server.     |  
   |`Mount Point`| `inside docker container dir`                                           |
   
 ![screenshot](https://github.com/hyeonsangjeon/vagrant-rancher2.0/blob/master/pic/deploystep3.png?raw=true)
 
 
###  Load Balancing(Ingress) Example


###  Catalog Apps Example 


