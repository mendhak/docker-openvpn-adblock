if [ "$#" -ne 1 ]; then
        echo "Usage: ./start.sh server.example.com"
        exit 1
fi


docker-compose up -d dnsmasq
LOCALDNS=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dnsmasq)
echo $LOCALDNS
docker-compose run --rm openvpnudp ovpn_genconfig -u udp://$1 -n $LOCALDNS
docker-compose up -d openvpnudp
docker-compose up -d openvpntcp

