/routing filter
add action=accept chain=WIRELINK-AS28368-OUT comment="ACCEPT OWN PREFIX" prefix=\
    131.221.236.0/22 prefix-length=22-24
add action=discard chain=WIRELINK-AS28368-OUT comment="DISCARD OWN PREFIX" prefix=\
    131.221.238.0/24
add action=discard chain=WIRELINK-AS28368-OUT comment="DISCARD ALL"
