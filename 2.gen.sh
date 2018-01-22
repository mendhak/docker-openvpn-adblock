if [ "$#" -ne 1 ]; then
	echo "Usage: ./gen.sh username"
	exit 1
fi
docker-compose run --rm ovpngen easyrsa build-client-full $1 nopass
docker-compose run --rm ovpngen ovpn_getclient $1 > $1.ovpn

