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
  
## Container Overview

## What is Container Runtime?

## What is Container Engine?

## Container High Level Architecture

## Container Orchestration Platform Overview

## Container Orchestration Platform High-Level Architecture
