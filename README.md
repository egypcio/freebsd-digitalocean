# freebsd-digitalocean

**DigitalOcean's Unofficial rc Script for FreeBSD Droplets**

1. Create a FreeBSD Droplet;
2. Log in and run the following commands;

    $ fetch -q https://github.com/egypcio/freebsd-digitalocean/archive/master.zip  
    $ unzip -q master.zip
    $ sudo /bin/sh freebsd-digitalocean-master/bootstrap.sh
	
3. Done.

At the end of the bootstraping process the machine will reboot. It's all fine! Before you try to log into the Droplet again verify the new generated hashes that `bootstrap.sh` created for you and enjoy.

Should you want to review the Droplet's information again, all you need is:

    $ service digitalocean info

