if [ "$#" -ne 1 ]; then
	echo "Usage: ./gen.sh clientname"
	exit 1
fi
docker-compose run --rm openvpntcp easyrsa build-client-full $1 nopass
docker-compose run --rm openvpntcp ovpn_getclient $1 > $1.ovpn

