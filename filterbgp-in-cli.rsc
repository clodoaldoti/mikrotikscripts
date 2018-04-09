/routing filter
add action=accept bgp-communities=200:666 chain=IN-CL1 comment=\
    "COMMYNITY BLACKHOLE 200:666" set-bgp-communities="" set-distance=\
    254 set-type=blackhole
add action=accept bgp-as-path="^(10,\?)+\$" chain=IN-CL1 comment=\
    "FILTRA PREFIXO CLI E AS" prefix=200.0.0.0/20
add action=accept bgp-as-path="^(10,\?)+\$" chain=IN-CL1 comment=\
    "FILTRA PREFIXO CLI E AS" prefix=177.12.0.0/24
add action=accept bgp-as-path="^(10,\?)+\$" chain=IN-CL1 comment=\
    "RECEBE DEFAULT ROUTER" prefix=0.0.0.0/0
add action=discard chain=IN-CL1 comment="DISCARD ALL"
