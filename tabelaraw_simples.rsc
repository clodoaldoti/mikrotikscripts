/ip firewall raw
add action=accept chain=prerouting comment="Deixa pacotes destinados a excessões passarem pela conntrack" dst-address-list=passar-pela-contrack
add action=accept chain=prerouting comment="Deixa pacotes originados a excessões passarem pela conntrack" src-address-list=passar-pela-contrack
add action=notrack chain=prerouting comment="Faz bypass de todo restante"

/ip firewall raw
add action=notrack chain=prerouting src-address=10.1.101.0/24 dst-address=10.1.202.0/24
add action=notrack chain=prerouting src-address=10.1.202.0/24 dst-address=10.1.101.0/24
