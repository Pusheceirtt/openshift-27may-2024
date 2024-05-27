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
