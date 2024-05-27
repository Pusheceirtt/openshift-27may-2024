# Day 1

## What is Boot Loaders
- it is system utility that get's installed in Master Boot Record(MBR)
- in our Hard Disk(storage) we have Sector 0, Byte 0 which is called as Master Boot Record(MBR)
- the boot loader software is installed in the MBR
- When a system is booted, first the BIOS Power On Self Test(POST) will happen
- Examples
  - LILO
  - GRUB 1/2

## What is dual/multi booting?
- installing dual or multiple OS on the same machine
- we can boot into only one OS at a time
- at any point of time only one Operating System can be active
- you need to install GRUB or similar boot loader to support booting into any one of the OS installed on your laptop/desktop

## What is Hypervisor?
- is nothing but Virtualization
- Virtualization is a Hardware + Software technology
- General Purpose Processors ( x86, x86_64 ) - 32 bit and 64 bit Processors
  - AMD ( AMD-V - Virtualization support )
  - Intel ( VT-X - Virtualiation support )
- Apple Silicon Processor - Based on ARM Processor ( M1/M2 - supports virtualization )
- Many OS can be actively running at the same time on the same laptop/desktop/workstation/server
- Examples
  - VMWare
    - Workstation - Type 2 Hypervisor ( Linux/Windows )
    - Fusion - Type 2 Hypervisor ( Mac OS-X )
    - vSphere/vCenter - Type 1 Hypervisor a.k.a Bare-metal Hypervisors 
  - Oracle Virtualbox - Type 2 Hypervisor ( Linux/Mac/Windows - Free )
  - Parallels - Type 2 Hypervisor ( Mac OS-X )
  - each OS runs in a separate Virtual Machine (VM)
  - each Virtual Machine requires dedicated hardware resources
    - Virtual CPU Cores
    - RAM - Actual
    - Storage - Actual
    - Network (Virtual - Software defined Network cards )
    - Graphics Card ( Virtual - Software defined Network cards )
  - Because every Virtual Machines requires dedicated hardware resources, this type of Virtualization is called Heavy-weight Virtualization
    
## Processor Packaging
- Processors comes in 2 packages
- Single Chip Module (SCM) - One Processor per IC
- Multiple Chip Module (MCM) - Many Processors per IC

## CPU Cores
- each Processor may host many CPU Cores
- For instance, these days AMD/Intel has Processors that support 128/256/512 cores in a single Processor

## Physical vs Logical/Virtual Cores
- each modern Physical CPUs are capable of running multiple threads parallely 
- Hyperthreading - each physical CPU supports 2/4/8 virtual cores

## To support 1000 OS, how many physical machines are required in the absence of Virtualization Technology
- 1000 Physical machines are required
- data-center maintenance
- cost of each server
- power consumption
- real-estate cost - lease/rent
- Uninterupped power supply (UPS/INverter)
- Air Conditioning
- Sound proofing

## To support 1000 OS, how many least number of physical machines are required with Virtualization support?
- 1 Server ie enough technically
- 8 Socket Server Motherboard
- Assume in each each Processor Socket we have installed a MCM packaged Processors
  - MCM IC with 4 Processors
  - Each Processor supports 128 Physical CPU Cores
  - each Socket - how many cores - 512 Physical CPU cores
  - In 8 Socket - how many cores - 512 x 8 = 4096 Physical CPU Cores
  - In 8 Sockets - how many virtual cores - 4096 x 2 = 8192 virtual/logical cores
- RAM/Storage
  
## Container Overview
### What they are not
- it is not Hypervisor
- it is not a Virtual Machine
- containers don't represent Operating System

### What they are
- it is an application virtualization technology
- it is a single application process
- each container represents one application
- one application may require one to many containers
- every container has its own network stack
- every container has its own software defined network(virtual) network card
- every container get its own file system
- every container get its own port range ( 0-65535 )
- they get their own IP address
- For example
  - Oracle DB Server can run in a single container
  - MySQL DB Server can run in a single container
  - Tomcat Server in a single container
  - REST/SOAP API can run inside a container
  - Webservice can run inside a container
  - one Microservice per container
  - one Application Server can run in a container
  - one Web Server can run in a container
  - one Message Queue Server can run in a container
  - Apache Kakfa Server can run in a container
  
### Containers don't have
- their own hardware resources
- their own OS Kernel

## What is Container Runtime?
- it is a low-level software
- it is not so user-friendly
- it manages container images and containers
- normally no end-users use the container runtimes directly
- Examples
  - runC
  - CRI-O 

## What is Container Engine?
- is a high-level software
- it offers user-friendly commands to manage container images and containers
- internally they depend on Container Runtimes to manage images and containers
- end-users like us, normally will use Container Engines as they are very user-friendly
- Examples
  - Docker is a Container Engine that depends on containerd which internally depends on runC container Runtime
  - Podman is a Container Engine that depends on CRI-O container Runtime

## Docker Overview
- is a container engine
- developed in Go language
- developed by a company called Docker Inc
- Docker comes in 2 flavours
  1. Community Edition - Docker CE ( Free )
  2. Enterprise Edition - Docker EE ( Paid )

## Podman Overview
- is opensource but primarily maintained by Red Hat
- CoreOS was the company that had 2 products
  - CoreOS - Operating system optimized for Container Orchestration Platforms
  - rkt - pronounced as rocket, which is a container runtime software
- Red Hat acquired CoreOS, they kind replaced rkt with CRI-o Container Runtime
- Red Hat CoreOS is now called Red Hat Enterprise Core OS (RHCOS)
- RHCOS is the Operating System used in Red Hat Openshift 4.x onwards
- Podman is opensource container engine maintained by Red Hat
- it is an alternate product for Docker

## Docker High Level Architecture
- follows client/server architecture
- client runs in user-space
- while server runs in kernel space ( as root user )
- end-users use only the client software to interact with the Docker server
- Docker server runs in the background as Service(daemon)
## Container Orchestration Platform Overview
- High-Level Features
  - provides a platform where you could your applications and make them Highly Available (HA)
  - it has built-in monitoring features to check the health of your application and repair them on need basis
    - readiness check ( it is live and ready to server user request )
    - liveliness check ( the application is running but may not ready to support user requests )
  - scale up/down
    - adding more instances of your application when the user-traffic increases
    - removing idle application instances when the user-traffic reduces
  - rolling update
    - upgrade your already live application from one version to other without any downtime
  - rollback
    - downgrade your already latest live application from latest version to older versions without any downtime
  - expose your container applications workloads to external world via Services ( Service discovery )
  - Services 2 types
    - Internal ( accessible within the orchestraion platform only ) and
    - External ( accessible outside the orchestrtion platform as well )
- can manage the application life cycle within the Orchestration platform
- Examples
  - Docker SWARM
    - a light-weight
    - free
    - Docker Inc's native Orchestration platform
    - it supports only Docker containerized application workloads
  - Google Kubernetes
    - opensource container orchestration platform
    - it supports managing different containerized application workloads
      - microservices running in docker container
      - tomcat running in containerd container
      - oracle db server running in LXC container
      - also supports Podman
    - initial days Kubernetes by default was supported Docker
  
  - Red Hat OpenShift
    - is developed on top of Google Kubernetes
    - it is an enterprise software that requires paid license

## Red Hat OpenShift - Container Orchestration Platform High-Level Architecture
- Openshift cluster has 2 types of nodes
  1. Master
  2. Worker
- Control Plane Components runs only in the master node
- Worker Nodes - this is where user application will be deployed by default
- It is also possible to configure the master nodes to allow deploying user applications apart from control plane components
- client tools
  - oc (openshift client tool)
  - kubectl ( kubernetes client tool )


## What are the Control Plane Compenents in OpenShift/Kubernetes
1. API Server
2. etcd key-value datastore/database
3. scheduler
4. controller managers ( a collection of many controllers )

#### API Server
- this is a collection REST APIs for every features supported by OpenShift
- stores the entire cluster status, user application status,nodes status, etc into the etcd database
- API Server is the only components normally has access to etcd databases
- all Openshift components interact with API Server by making a REST API call
- API Server responds to REST calls via events
- Whenever API servers makes any change in etcd database, it will be followed by a broadcasting event about the change it made in the etcd db
- oc/kubectl client tools will also talk to API server only
  
#### etcd database
- key/value database
- 
#### Scheduler

#### Controller Managers
- it is a collection of many controllers
- controllers are applications that run continuously in an infinite loop waiting for events
  - new deployment created
  - new Pod created
  - Pod deleted
  - deployment deleted
  - Deployment scaled up
  - Deployment scaled down
- every Resource in Openshift is managed by one Controller
- Example
  - Deployment is a resource in Kubernetes/Openshift that represents an application deployment
  - Deployment Controller is the controller that monitors, manages, repairs the Deployment resource
  - ReplicaSet controller monitors, manages and repairs ReplicaSet resource
  - Endpoint Controller
  - Job Controller
  - CronJob Controller
  - DaemonSet Controller
  - StatefulSet Controller
  - ReplicationController

## What is a Pod?
- a collection of many related containers
- inside each container one application or component will be running
- multiples are hosted/running
- it is record/yaml definition stored in etcd database
- is the smallest unit that can be deployed into Openshift/Kubernetes
- For instance
  - If you deploy Jenkins, jenkins will run inside a container which is part of a Pod
- Unlike container, where each container gets IP address(es), in Kubernetes/Openshift IP address(es) are assigned on the Pod level not on the container level
- In other words, the containers running with the same Pod shares the same IP address and ports
  
## OpenShift resources
- Deployment
- ReplicaSet
- Pod
- all the above are resources (yaml definitions) records stored in etcd database
- 

## Lab - Find the Openshift version details
```
oc version
```

Expected output
<pre>
jegan@tektutor.org $ oc version
Client Version: 4.15.12
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: 4.15.12
Kubernetes Version: v1.28.9+2f7b992  
</pre>

## Lab - Listing the openshift nodes in the cluster
```
oc get nodes
```

Expected output
<pre>
jegan@tektutor.org $ oc get nodes
NAME                              STATUS   ROLES                         AGE    VERSION
master-1.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992
master-2.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992
master-3.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992
worker-1.ocp4.tektutor.org.labs   Ready    worker                        7d     v1.28.9+2f7b992
worker-2.ocp4.tektutor.org.labs   Ready    worker                        7d     v1.28.9+2f7b992  
</pre>

## Lab - Finding the IP address of nodes, finding the OS installed on the nodes
You can use the wide mode to find
- Ip address of the nodes
- OS installed on the nodes
- CRI-O Container Runtime version
- Node Status
- Node roles ( master/worker )
```
oc get nodes -o wide
```

Expected output
<pre>
jegan@tektutor.org $ oc get nodes -o wide
NAME                              STATUS   ROLES                         AGE    VERSION           INTERNAL-IP       EXTERNAL-IP   OS-IMAGE                                                       KERNEL-VERSION                 CONTAINER-RUNTIME
master-1.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992   192.168.122.35    <none>        Red Hat Enterprise Linux CoreOS 415.92.202404302054-0 (Plow)   5.14.0-284.64.1.el9_2.x86_64   cri-o://1.28.6-2.rhaos4.15.git77bbb1c.el9
master-2.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992   192.168.122.112   <none>        Red Hat Enterprise Linux CoreOS 415.92.202404302054-0 (Plow)   5.14.0-284.64.1.el9_2.x86_64   cri-o://1.28.6-2.rhaos4.15.git77bbb1c.el9
master-3.ocp4.tektutor.org.labs   Ready    control-plane,master,worker   7d1h   v1.28.9+2f7b992   192.168.122.36    <none>        Red Hat Enterprise Linux CoreOS 415.92.202404302054-0 (Plow)   5.14.0-284.64.1.el9_2.x86_64   cri-o://1.28.6-2.rhaos4.15.git77bbb1c.el9
worker-1.ocp4.tektutor.org.labs   Ready    worker                        7d     v1.28.9+2f7b992   192.168.122.102   <none>        Red Hat Enterprise Linux CoreOS 415.92.202404302054-0 (Plow)   5.14.0-284.64.1.el9_2.x86_64   cri-o://1.28.6-2.rhaos4.15.git77bbb1c.el9
worker-2.ocp4.tektutor.org.labs   Ready    worker                        7d     v1.28.9+2f7b992   192.168.122.38    <none>        Red Hat Enterprise Linux CoreOS 415.92.202404302054-0 (Plow)   5.14.0-284.64.1.el9_2.x86_64   cri-o://1.28.6-2.rhaos4.15.git77bbb1c.el9  
</pre>

## Lab - Each container gets an IP address in Docker ( Not in Openshift/Kubernetes )
```
docker run -dit --name c1 --hostname c1 ubuntu:16.04 /bin/bash
docker run -dit --name c2 --hostname c2 ubuntu:16.04 /bin/bash
docker ps
docker inspect -f {{.NetworkSettings.IPAddress}} c1
docker inspect -f {{.NetworkSettings.IPAddress}} c2
docker inspect c2 | grep IPA
docker inspect c1 | grep IPA
```

Expected output
<pre>
 jegan@tektutor.org $ docker run -dit --name c1 --hostname c1 ubuntu:16.04 /bin/bash
21d42db717ee5122e048dfd631521738410cb268941f27048e9229e6d607323a
 jegan@tektutor.org $ docker run -dit --name c2 --hostname c2 ubuntu:16.04 /bin/bash
4fc195efc2650c814f995a0cce706c4c6e9ef9a2f8c0d673f3bcaf9e8e27e669
 jegan@tektutor.org $ docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS         PORTS     NAMES
4fc195efc265   ubuntu:16.04   "/bin/bash"   2 seconds ago   Up 1 second              c2
21d42db717ee   ubuntu:16.04   "/bin/bash"   7 seconds ago   Up 6 seconds             c1
 jegan@tektutor.org $ docker inspect -f {{.NetworkSettings.IPAddress}} c1
172.17.0.2
 jegan@tektutor.org $ docker inspect -f {{.NetworkSettings.IPAddress}} c2
172.17.0.3
 jegan@tektutor.org $ docker inspect c2 | grep IPA                       
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.3",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.3",
 jegan@tektutor.org $ docker inspect c1 | grep IPA
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.2",  
</pre>
