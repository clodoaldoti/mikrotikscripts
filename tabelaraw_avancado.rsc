/ip firewall filter
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" connection-state=established,related
add action=accept chain=forward comment="defconf: accept established,related, untracked" connection-state=\
    established,related,untracked
add action=drop chain=forward comment="defconf: drop invalid" connection-state=invalid
add action=drop chain=forward comment="defconf:  drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface-list=WAN

add action=accept chain=input comment="defconf: accept ICMP after RAW" protocol=icmp
add action=accept chain=input comment="TEMP allow" src-address=10.0.0.0/8 disabled=yes
add action=accept chain=input comment="defconf: accept established,related,untracked" connection-state=\
    established,related,untracked
add action=drop chain=input comment="defconf: drop all from WAN" in-interface-list=WAN


/ip firewall raw
add action=accept chain=prerouting comment="TEMP allow" src-address=10.0.0.0/8 disabled=yes
add action=accept chain=prerouting comment="defconf: enable for transparent firewall" disabled=yes
add action=drop chain=prerouting comment="defconf: drop from bogon IP's" in-interface-list=WAN src-address-list=\
    BOGONS
add action=drop chain=prerouting comment="defconf: drop local if not from default IP range" in-interface-list=LAN \
    src-address=!192.168.88.0/24 disabled=yes
add action=drop chain=prerouting comment="defconf: drop bad UDP" port=0 protocol=udp

add action=jump chain=prerouting comment="defconf: jump to ICMP chain" jump-target=icmp4 protocol=icmp

add action=jump chain=prerouting comment="defconf: jump to TCP chain" jump-target=bad_tcp protocol=tcp

add action=accept chain=prerouting comment="defconf: accept everything else from LAN" in-interface-list=LAN
add action=accept chain=prerouting comment="BRAUSER: accept ack from WAN" in-interface-list=WAN protocol=tcp tcp-flags=ack
add action=accept chain=prerouting comment="BRAUSER: accept udp responses from WAN" in-interface-list=WAN protocol=udp src-port=53,123,443,1194

add action=drop chain=prerouting comment="ATENÇÃO PERIGO" disabled=yes

add action=accept chain=icmp4 comment="defconf: echo reply" icmp-options=0:0 limit=5,10:packet protocol=icmp
add action=accept chain=icmp4 comment="defconf: net unreachable" icmp-options=3:0 protocol=icmp
add action=accept chain=icmp4 comment="defconf: host unreachable" icmp-options=3:1 protocol=icmp
add action=accept chain=icmp4 comment="defconf: protocol unreachable" icmp-options=3:2 protocol=icmp
add action=accept chain=icmp4 comment="defconf: port unreachable" icmp-options=3:3 protocol=icmp
add action=accept chain=icmp4 comment="defconf: fragmentation needed" icmp-options=3:4 protocol=icmp
add action=accept chain=icmp4 comment="defconf: echo" icmp-options=8:0 limit=5,10:packet protocol=icmp
add action=accept chain=icmp4 comment="defconf: time exceeded " icmp-options=11:0-255 protocol=icmp
add action=drop chain=icmp4 comment="defconf: drop other icmp" protocol=icmp

add action=drop chain=bad_tcp comment="defconf: TCP flag filte" protocol=tcp tcp-flags=!fin,!syn,!rst,!ack
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=fin,syn
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=fin,rst
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=fin,!ack
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=fin,urg
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=syn,rst
add action=drop chain=bad_tcp comment=defconf protocol=tcp tcp-flags=rst,urg
add action=drop chain=bad_tcp comment="defconf: TCP port 0 drop" port=0 protocol=tcp
