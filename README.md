# kaksam_infra
kaksam Infra repository

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
