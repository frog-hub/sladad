resource "proxmox_vm_qemu" "dc01" {
    name = "DC01"
    desc = "DC01 - windows server 2019 - 172.16.10.10"
    qemu_os = "win10"
    target_node = var.pm_node
    pool = var.pm_pool

    sockets = 1
    cores = 2
    memory = 4096
    agent = 1
    clone = "WinServer2019x64-cloudinit-qcow2"

   network {
     bridge    = "vmbr2"
     model     = "e1000"
     tag       = 10
   }
    lifecycle {
      ignore_changes = [
        disk,
      ]
    }
   nameserver = "172.16.100.1"
   ipconfig0 = "ip=172.16.100.10/24,gw=172.16.100.254"
}

resource "proxmox_vm_qemu" "dc02" {
    name = "DC02"
    desc = "DC02 - windows server 2019 - 172.16.100.11"
    qemu_os = "win10"
    target_node = var.pm_node
    pool = var.pm_pool
    sockets = 1
    cores = 2
    memory = 4096
    agent = 1
    clone = "WinServer2019x64-cloudinit-qcow2"
    network {
      bridge    = "vmbr2"
      model     = "e1000"
      tag       = 10
    }
    lifecycle {
      ignore_changes = [
        disk,
      ]
    }
   nameserver = "172.16.100.1"
   ipconfig0 = "ip=172.16.100.11/24,gw=172.16.100.254"
}

resource "proxmox_vm_qemu" "DC03" {
    name = "DC03"
    desc = "DC03 - windows server 2016 - 172.16.100.12"
    qemu_os = "win10"

    target_node = var.pm_node
    pool = var.pm_pool

    sockets = 1
    cores = 2
    memory = 4096
    agent = 1
    clone = "WinServer2016x64-cloudinit-qcow2"

    network {
      bridge    = "vmbr2"
      model     = "e1000"
      tag       = 10
    }
    lifecycle {
      ignore_changes = [
        disk,
      ]
    }
   nameserver = "172.16.100.1"
   ipconfig0 = "ip=172.16.100.12/24,gw=172.16.100.254"
}

resource "proxmox_vm_qemu" "srv02" {
    name = "SRV02"
    desc = "SRV02 - windows server 2019 - 172.16.100.22"
    qemu_os = "win10"
    target_node = var.pm_node
    pool = var.pm_pool
    sockets = 1
    cores = 2
    memory = 4096
    agent = 1
    clone = "WinServer2019x64-cloudinit-qcow2"

    network {
      bridge    = "vmbr2"
      model     = "e1000"
      tag       = 10
    }
    lifecycle {
      ignore_changes = [
        disk,
      ]
    }
    nameserver = "172.16.100.1"
    ipconfig0 = "ip=172.16.100.22/24,gw=172.16.100.254"
}

resource "proxmox_vm_qemu" "srv03" {
    name = "SRV03"
    desc = "SRV03 - windows server 2016 - 172.16.100.23"
    qemu_os = "win10"
    target_node = var.pm_node
    pool = var.pm_pool
    sockets = 1
    cores = 2
    memory = 4096
    agent = 1
    clone = "WinServer2016x64-cloudinit-qcow2"

    network {
      bridge    = "vmbr2"
      model     = "e1000"
      tag       = 10
    }

    lifecycle {
      ignore_changes = [
        disk,
      ]
    }
    nameserver = "172.16.100.1"
    ipconfig0 = "ip=172.16.100.23/24,gw=172.16.100.254"
}