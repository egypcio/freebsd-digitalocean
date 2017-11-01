# freebsd-digitalocean

DigitalOcean's Unofficial/Experimental rc Script

1. Create a FreeBSD Droplet (10.3, 10.4, 11.0, or 11.1; UFS or ZFS. It doesn't matter);
2. Run the steps below in your brand new FreeBSD Droplet;

	```
	$ fetch -q https://github.com/egypcio/freebsd-digitalocean/archive/master.zip  
	$ unzip -q master.zip
	$ sudo /bin/sh freebsd-digitalocean-master/bootstrap.sh
	```
	
3. Done.
