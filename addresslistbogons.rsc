/ip firewall address-list
add address=0.0.0.0/8 comment="defconf: RFC6890" list=BOGONS
add address=172.16.0.0/12 comment="defconf: RFC6890" list=BOGONS
add address=192.168.0.0/16 comment="defconf: RFC6890" list=BOGONS
add address=10.0.0.0/8 comment="defconf: RFC6890" list=BOGONS
add address=169.254.0.0/16 comment="defconf: RFC6890" list=BOGONS
add address=127.0.0.0/8 comment="defconf: RFC6890" list=BOGONS
add address=224.0.0.0/4 comment="defconf: RFC6890" list=BOGONS
add address=198.18.0.0/15 comment="defconf: RFC6890" list=BOGONS
add address=192.0.0.0/24 comment="defconf: RFC6890" list=BOGONS
add address=192.0.2.0/24 comment="defconf: RFC6890" list=BOGONS
add address=198.51.100.0/24 comment="defconf: RFC6890" list=BOGONS
add address=203.0.113.0/24 comment="defconf: RFC6890" list=BOGONS
add address=100.64.0.0/10 comment="defconf: RFC6890" list=BOGONS
add address=240.0.0.0/4 comment="defconf: RFC6890" list=BOGONS
add address=192.88.99.0/24 comment="defconf: 6to4 relay Anycast RFC 3068" list=BOGONS
