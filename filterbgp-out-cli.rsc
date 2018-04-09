/routing filter
add action=accept chain=CLI-OUT comment="ANUNCIO DE BLACKHOLE" prefix=100.0.0.1 \
    prefix-length=32 set-bgp-communities=200:666
add action=accept chain=CLI-OUT comment=\
    "FILTRO OUT COM 3 PREPEND E COMMUNITY 200:10" prefix=200.0.0.0/20 \
    prefix-length=20-24 set-bgp-communities=200:10 set-bgp-prepend=3
add action=discard chain=CLI-OUT
