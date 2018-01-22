
### Docker Compose setup with OpenVPN and adblocking


Makes use of [docker-openvpn](https://github.com/kylemanna/docker-openvpn/) and [docker-dns-ad-blocker](https://github.com/oznu/docker-dns-ad-blocker).  


Sets up the adblocking container, and also includes the local [rules .conf file](dnsmasq-rules/myblacklist.conf). The container automatically updates its blacklist daily, and uses Google's DNS servers.  This can be changed in the docker-compose.yml file. 

Sets up OpenVPN to listen on both TCP (port 563) and UDP (port 1194).  Sets the DNS server to be the above adblocking container. This can be changed int he docker-compose.yml file. 

Together, this setup allows for you to connect to this OpenVPN server, with built-in adblocking. 

