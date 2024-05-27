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

## What is Container Engine?

## Container High Level Architecture

## Container Orchestration Platform Overview

## Container Orchestration Platform High-Level Architecture
