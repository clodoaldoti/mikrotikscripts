/routing filter
add action=discard chain=WIRELINK-AS28368-IN comment="DISCARD OWN PREFIX" prefix=\
    131.221.236.0/22 prefix-length=22-32 protocol=bgp
add action=discard chain=WIRELINK-AS28368-IN comment="DISCARD LOWEST THAN /24" \
    prefix-length=25-32 protocol=bgp
add action=jump chain=WIRELINK-AS28368-IN comment="JUMP BOGONS - IPv4" jump-target=\
    BOGONSv4
add action=discard chain=WIRELINK-AS28368-IN comment="DISCARD DEFAULT ROUTE" disabled=\
    yes prefix=0.0.0.0/0 prefix-length=0
add action=accept chain=WIRELINK-AS28368-IN comment="ACCEPT ALL ROUTES BGP"
add action=discard chain=WIRELINK-AS28368-IN comment="DISCARD ALL"
add action=discard chain=BOGONSv4 prefix=0.0.0.0/8 prefix-length=8-32
add action=discard chain=BOGONSv4 prefix=10.0.0.0/8 prefix-length=8-32
add action=discard chain=BOGONSv4 prefix=127.0.0.0/8 prefix-length=8-32
add action=discard chain=BOGONSv4 prefix=172.16.0.0/12 prefix-length=12-32
add action=discard chain=BOGONSv4 prefix=169.254.0.0/16 prefix-length=16-32
add action=discard chain=BOGONSv4 prefix=192.0.0.0/24 prefix-length=24-32
add action=discard chain=BOGONSv4 prefix=192.0.2.0/24 prefix-length=24-32
add action=discard chain=BOGONSv4 prefix=192.88.99.0/24 prefix-length=24-32
add action=discard chain=BOGONSv4 prefix=192.168.0.0/16 prefix-length=16-32
add action=discard chain=BOGONSv4 prefix=198.18.0.0/15 prefix-length=15-32
add action=discard chain=BOGONSv4 prefix=198.51.100.0/24 prefix-length=24-32
add action=discard chain=BOGONSv4 prefix=203.0.113.0/24 prefix-length=24-32
add action=discard chain=BOGONSv4 prefix=224.0.0.0/4 prefix-length=4-32
add action=discard chain=BOGONSv4 prefix=240.0.0.0/4 prefix-length=4-32
add action=return chain=BOGONSv4
