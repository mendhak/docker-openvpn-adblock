
### Docker Compose setup with OpenVPN and adblocking


Makes use of [docker-openvpn](https://github.com/kylemanna/docker-openvpn/) and [docker-dns-ad-blocker](https://github.com/oznu/docker-dns-ad-blocker).  


Sets up the adblocking container, and also includes the local [rules .conf file](dnsmasq-rules/myblacklist.conf). The container automatically updates its blacklist daily, and uses Google's DNS servers.  This can be changed in the docker-compose.yml file. 

Sets up OpenVPN to listen on both TCP (port 563) and UDP (port 1194).  Sets the DNS server to be the above adblocking container. This can be changed int he docker-compose.yml file. 

Together, this setup allows for you to connect to this OpenVPN server, with built-in adblocking. 

### To run it

    sudo ./1.init.sh clientname server.example.com


* clientname - the profile, such as `workpc` - this results in a `workpc.ovpn` for example.
* server.example.com - the server where these containers will be hosted

When the script is run, follow the prompts and enter passwords where necessary. When asked for a Common Name, enter your server's DNS or IP address.


### To generate another .ovpn

    sudo ./2.gen.sh `myfriend` 

This will result in a `myfriend.ovpn`    

### To start over

Remove the containers

    sudo docker-compose stop
    sudo docker-compose rm -f

Remove generated files

    rm -f openvpn-data/
    rm *.ovpn

    