# srsRAN Ansible

### On your NMS dashboard do the following changes:

Create an APN plan with `default` APN ID:
```
Traffic -> APNs -> Create New APN
```

Set your `MCC`, `MNC` and `TAC` to the following:
```
Network -> EPC -> MCC -> 001
Network -> EPC -> MNC -> 01
Network -> EPC -> TAC -> 7
```

Upload `subscribers.csv` IMSI list from previous directory:
```
Subscriber -> Config -> Add Subscriber -> Upload
```
---

### Setup Ansible variables

Update `hosts.yaml` as per your system

Variables | Notes
---|---
hosts | IP of the server where we have to deploy srsRAN.
ansible_user | Username of server machine.
mme_addr | MME IP of Magma's Access Gateway. (IP of eth1 interface from Magma Access Gateway)
bind_addr | This should be your interface IP that will be used to communicate with MME. (this should not be floating ip)
docker_image | Based on your processor you may have to rebuild docker image. Push it to dockerhub and update this variable.

---

### Pre-requisite Packages require

download docker module:
```bash
ansible-galaxy collection install community.docker
```
---

### Deploy srsRAN

Install srsRAN with docker:
```bash
ansible-playbook install-everything.yaml
```

