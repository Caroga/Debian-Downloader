Debian Downloader
===================
Well, it's not a repository that makes it easy to download Debian, but more something that turns your Debian server into a download machine / seedbox if you like.

Using Ansible, this set of roles will install the following software:

 - [SickRage](https://github.com/SiCKRAGETV/SickRage) (fork from [SickBeard](http://sickbeard.com/))
 - [CouchPotato](https://couchpota.to/)
 - [Deluge](http://deluge-torrent.org/)

Future additions
----------------
I am planning to add the following software/configurations:

 - Nginx, to enable a reverse proxy to resolve something like "http://downloader.vm/couchpotato"
 - SABnzbd or NZBGet, usenet downloader
 - HeadPhones, Automatic music downloader for SABnzbd
 - HTPC-Manager, as I like to actually have 1 interface to rule them all!
 - Tie them all together, sharing a preselected media location to create a NFS share and automatically add it into CouchPotato and SickRage if possible.
 - Kick back, and watch stuff happen.

Prerequisites
-
Make sure you have the following tools installed:

 - Virtualbox version 4.3.10 or higher ([download](https://www.virtualbox.org/wiki/Downloads))
 - Vagrant 1.6.5 or higher ([download](https://www.vagrantup.com/downloads.html))
 - Ansible 1.7.2 or higher ([installation instructions](http://docs.ansible.com/intro_installation.html))

Launching the development environment
-------
First check out the project as this is not a complete turnkey solution *yet*. So run the test setup first and look around to see if this is what you can work with. Since we are using Vagrant this should be as easy as using `vagrant up` after you cloned this repository.

If you want to kick this into your Debian server then firing ansible with the correct user towards your Debian environment should be enough.
Make sure that you use a user with (sudo) root rights. 


Known issues
-------

**Error**

    GATHERING FACTS *************************************************************** 
    fatal: [192.168.31.100] => SSH encountered an unknown error during the connection. We recommend you re-run the command using -vvvv, which will enable SSH debugging output to help diagnose the issue
**Solution**
It may occur that Vagrant will try to provision the machine while the machine is not yet ready to recieve connections. Try running `vagrant provision` directly after this error, you will see it works fine.