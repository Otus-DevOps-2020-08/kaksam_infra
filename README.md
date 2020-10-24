# kaksam_infra

kaksam Infra repository
**HW #10**

    * using: ansible tags, playbooks, templates, hundlers
    * modules: systemd, copy, templates, git, bundler, apt, apt_key, apt_repository
    * dynamic vars from dynamic variables
    * packer + ansible

**HW #9**

    * Install ansible
    * Use ad-hoc command and playbooks
    * use inventory with ini yml and dynamic json

**HW #8**

    * created VPC subnet via terraform and apply to VM
    * read about `depends_on`
    * created app image and db image via packer
    * created modules: app and db
    * created two environment stage and pro
    * created bucked to save stages
    * added provisoner to connect app and db VM

**HW #7**

    * install terraform
    * created main.tf for describe instance
    * created outputs.tf fot output prints
    * created lb.tf for dynamyc creating loadbalancer
    * LB was checked

**HW #6**

    * packer installed
    * created service acc for packer
    * created template and variables files(added to .gitignore)
    * created fake variable file
    * was used "pauser_befor" for apt conflict

for create immutable image:

`packer build -var-file=variables.json immutable.json `

for create VM from image:

`.config-scripts/create-reddit-vm.sh`

to check:

`http://130.193.50.243:9292/`

**HW #5**

testapp_IP = 84.201.157.109

testapp_port = 9292

Scripts for autoinstall are created

```
install_ruby.sh
install_mongodb.sh
deploy.sh
```

File with metadata created.

**HW #4**


bastion_IP = 178.154.226.134

someinternalhost_IP = 10.130.0.17

You can use this command for connection to someinternalhost through bastion

Use man ssh to read about `-J` key

`ssh -i .ssh/appuser -A -J appuser@178.154.226.134 appuser@10.130.0.17`

Also you can edit `~/.ssh/config` file for hosts configuration

````
Host bastion
    Hostname 178.154.226.134
    User appuser
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    Hostname 10.130.0.17
    User appuser
    IdentityFile ~/.ssh/appuser
    ProxyJump bastion
````

Connect to host using `ssh someinternalhost`

```
kaksam@kaksam:~/.ssh$ ssh someinternalhost
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

appuser@someinternalhost:~$
```

------------
`Just for fun`

I`m not sure, that it was needed, but:
```
kaksam@kaksam:~/.ssh$ alias someinternalhost="ssh someinternalhost"
kaksam@kaksam:~/.ssh$ someinternalhost
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

appuser@someinternalhost:~$

```

For permanent =):

`kaksam@kaksam:~/.ssh$ echo "alias someinternalhost=\"ssh someinternalhost\"" >> ~/.bashrc`


----------------------
SSL validation:
`sudo echo 178.154.226.134 178.154.226.134.sslip.io >> /etc/hosts`

Open https://178.154.226.134/ Setting > Add 178.154.226.134.sslip.io to Lets Encrypt Domain

`ssh -i ~/.ssh/appuser appuser@10.130.0.17`

works correctly after ovpn established
