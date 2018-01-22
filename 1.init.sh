
if [ "$#" -ne 2 ]; then
	echo "Usage: ./1.init.sh clientname server.example.com"
	exit 1
fi

docker-compose up -d dnsmasq
LOCALDNS=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dnsmasq)
echo $LOCALDNS
docker-compose run --rm openvpnudp ovpn_genconfig -u udp://$2 -n $LOCALDNS
docker-compose run --rm openvpnudp ovpn_initpki
sudo chown -R $(whoami): ./openvpn-data
docker-compose up -d openvpnudp
docker-compose run --rm openvpnudp easyrsa build-client-full $1 nopass
docker-compose run --rm openvpnudp ovpn_getclient $1 > $1.ovpn
docker-compose up -d openvpntcp 
echo "persist-tun" >> $1.ovpn

