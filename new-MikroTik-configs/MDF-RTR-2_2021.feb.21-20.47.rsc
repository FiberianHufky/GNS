# feb/21/2021 20:47:54 by RouterOS 6.48.1
# software id = 
#
#
#
/interface bridge
add name=BR pvid=666 vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no name=ether1-MGMT
set [ find default-name=ether14 ] disable-running-check=no name=sfp28-1<-PCSS
set [ find default-name=ether15 ] disable-running-check=no name=sfp28-2<-OPL
set [ find default-name=ether2 ] disable-running-check=no name=\
    sfpplus1<-MDF-AGG-01->qsfp2-1
set [ find default-name=ether3 ] disable-running-check=no name=\
    sfpplus2<-MDF-AGG-01->qsfp2-2
set [ find default-name=ether4 ] disable-running-check=no name=\
    sfpplus3<-MDF-AGG-02->qsfp2-1
set [ find default-name=ether5 ] disable-running-check=no name=\
    sfpplus4<-MDF-AGG-02->qsfp2-1
set [ find default-name=ether6 ] disable-running-check=no disabled=yes name=\
    sfpplus5
set [ find default-name=ether7 ] disable-running-check=no disabled=yes name=\
    sfpplus6
set [ find default-name=ether8 ] disable-running-check=no disabled=yes name=\
    sfpplus7
set [ find default-name=ether9 ] disable-running-check=no disabled=yes name=\
    sfpplus8
set [ find default-name=ether10 ] disable-running-check=no disabled=yes name=\
    sfpplus9
set [ find default-name=ether11 ] disable-running-check=no disabled=yes name=\
    sfpplus10
set [ find default-name=ether12 ] disable-running-check=no disabled=yes name=\
    sfpplus11
set [ find default-name=ether13 ] disable-running-check=no disabled=yes name=\
    sfpplus12
/interface vlan
add interface=BR mtu=1496 name=VLAN70-Printers vlan-id=70
add interface=BR mtu=1496 name=VLAN80-Guest vlan-id=80
add interface=BR mtu=1496 name=VLAN90-BYOD vlan-id=90
add interface=BR mtu=1496 name=VLAN100-Company_1 vlan-id=100
add interface=BR mtu=1496 name=VLAN2137-MGMT vlan-id=2137
/interface bonding
add mode=802.3ad name=bonding-MDF-AGG-1 slaves=\
    sfpplus1<-MDF-AGG-01->qsfp2-1,sfpplus2<-MDF-AGG-01->qsfp2-2
add mode=802.3ad name=bonding-MDF-AGG-2 slaves=\
    sfpplus3<-MDF-AGG-02->qsfp2-1,sfpplus4<-MDF-AGG-02->qsfp2-1
/interface vrrp
add interface=VLAN70-Printers name=VRRP70-Printers priority=101 vrid=70
add interface=VLAN80-Guest name=VRRP80-Guest priority=101 vrid=80
add interface=VLAN90-BYOD name=VRRP90-BYOD priority=101 vrid=90
add interface=VLAN100-Company_1 name=VRRP100-Company_1 priority=101 vrid=100
add interface=VLAN2137-MGMT name=VRRP2137-MGMT priority=101 vrid=213
/interface list
add name=WAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add disabled=no interface=VLAN70-Printers lease-time=52w1d name=DHCP-Printers
/ip pool
add name=Pool-Guest ranges=10.80.2.129-10.80.3.254
add name=Pool-BYOD ranges=10.90.2.129-10.90.3.254
add name=Pool-Company_1 ranges=10.100.1.1-10.100.1.254
/ip dhcp-server
add address-pool=Pool-Guest disabled=no interface=VLAN80-Guest lease-time=15m \
    name=DHCP-Guest
add address-pool=Pool-BYOD disabled=no interface=VLAN90-BYOD lease-time=1d \
    name=DHCP-BYOD
add address-pool=Pool-Company_1 disabled=no interface=VLAN100-Company_1 \
    lease-time=1d name=DHCP-Company_1
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/dude
set enabled=yes
/interface bridge port
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-2 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether1-MGMT pvid=666
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2,ether1-MGMT \
    vlan-ids=2137
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=70
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=80
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=90
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=100
/interface list member
add interface=sfp28-1<-PCSS list=WAN
add interface=sfp28-2<-OPL list=WAN
/ip address
add address=10.21.37.3/24 interface=VLAN2137-MGMT network=10.21.37.0
add address=10.21.37.1 interface=VRRP2137-MGMT network=10.21.37.1
add address=10.70.0.1 interface=VRRP70-Printers network=10.70.0.1
add address=10.70.0.3/24 interface=VLAN70-Printers network=10.70.0.0
add address=10.80.0.1 interface=VRRP80-Guest network=10.80.0.1
add address=10.80.0.3/22 interface=VLAN80-Guest network=10.80.0.0
add address=10.90.0.1 interface=VRRP90-BYOD network=10.90.0.1
add address=10.90.0.3/22 interface=VLAN90-BYOD network=10.90.0.0
add address=10.100.0.1 interface=VRRP100-Company_1 network=10.100.0.1
add address=10.100.0.3/23 interface=VLAN100-Company_1 network=10.100.0.0
/ip dhcp-client
# DHCP client can not run on slave interface!
add disabled=no interface=ether1-MGMT
add add-default-route=no disabled=no interface=sfp28-1<-PCSS
add add-default-route=no disabled=no interface=sfp28-2<-OPL
/ip dhcp-server lease
add address=10.70.0.254 client-id=1:0:50:79:66:68:0 mac-address=\
    00:50:79:66:68:00 server=DHCP-Printers
/ip dhcp-server network
add address=10.21.37.0/24 dns-server=10.21.37.1 gateway=10.21.37.1 netmask=24 \
    ntp-server=10.21.37.1
add address=10.70.0.0/24 dns-server=10.70.0.1 gateway=10.70.0.1 ntp-server=\
    10.70.0.1
add address=10.80.0.0/22 dns-server=1.1.1.1,1.0.0.1 gateway=10.80.0.1 \
    ntp-server=10.80.0.1
add address=10.90.0.0/22 dns-server=1.1.1.1,1.0.0.1 gateway=10.90.0.1 \
    ntp-server=10.90.0.1
add address=10.100.0.0/23 dns-server=1.1.1.1,1.0.0.1 gateway=10.100.0.1 \
    ntp-server=10.100.0.1
/ip dns
set allow-remote-requests=yes
/ip firewall filter
add action=passthrough chain=input comment="***RTR INPUT***"
add action=accept chain=input comment=MGMT src-address=10.21.37.0/24
add action=accept chain=input comment="NTP server" connection-state=new \
    dst-port=123 protocol=udp
add action=accept chain=input comment=!New connection-state=\
    established,related
add action=passthrough chain=forward comment=***WAN***
add action=accept chain=forward comment="!NEW WAN to MGMT" connection-state=\
    established,related dst-address=10.21.37.0/24 in-interface-list=WAN
add action=accept chain=forward comment="!NEW WAN to Printers" \
    connection-state=established,related dst-address=10.70.0.0/24 \
    in-interface-list=WAN
add action=accept chain=forward comment="!NEW WAN to Guest" connection-state=\
    established,related dst-address=10.80.0.0/22 in-interface-list=WAN
add action=accept chain=forward comment="!NEW WAN to BYOD" connection-state=\
    established,related dst-address=10.90.0.0/22 in-interface-list=WAN
add action=accept chain=forward comment="!NEW Company_1 to BYOD" \
    connection-state=established,related dst-address=10.100.0.0/22 \
    in-interface-list=WAN
add action=accept chain=forward comment="NEW MGMT to WAN" connection-state=\
    new out-interface-list=WAN src-address=10.21.37.0/24
add action=accept chain=forward comment="!NEW MGMT to WAN" connection-state=\
    established,related out-interface-list=WAN src-address=10.21.37.0/24
add action=accept chain=forward comment="NEW Printers to WAN" \
    connection-state=new out-interface-list=WAN src-address=10.70.0.0/24
add action=accept chain=forward comment="!NEW Printers to WAN" \
    connection-state=established,related out-interface-list=WAN src-address=\
    10.70.0.0/24
add action=accept chain=forward comment="NEW Guest to WAN" connection-state=\
    new out-interface-list=WAN src-address=10.80.0.0/22
add action=accept chain=forward comment="!NEW Guest to WAN" connection-state=\
    established,related out-interface-list=WAN src-address=10.80.0.0/22
add action=accept chain=forward comment="NEW BYOD to WAN" connection-state=\
    new out-interface-list=WAN src-address=10.90.0.0/22
add action=accept chain=forward comment="!NEW BYOD to WAN" connection-state=\
    established,related out-interface-list=WAN src-address=10.90.0.0/22
add action=accept chain=forward comment="NEW Company_1 to WAN" \
    connection-state=new out-interface-list=WAN src-address=10.100.0.0/22
add action=accept chain=forward comment="!NEW Company_1 to WAN" \
    connection-state=established,related out-interface-list=WAN src-address=\
    10.100.0.0/22
add action=passthrough chain=forward comment=***INTERVLAN***
add action=accept chain=forward comment="NEW MGMT to Printers" \
    connection-state=new dst-address=10.70.0.0/24 src-address=10.21.37.0/24
add action=accept chain=forward comment="!NEW Printers to MGMT" \
    connection-state=established,related dst-address=10.21.37.0/24 \
    src-address=10.70.0.0/24
add action=accept chain=forward comment="NEW MGMT to Guest" connection-state=\
    new dst-address=10.80.0.0/22 src-address=10.21.37.0/24
add action=accept chain=forward comment="!NEW Guest to MGMT" \
    connection-state=established,related dst-address=10.21.37.0/24 \
    src-address=10.80.0.0/22
add action=accept chain=forward comment="NEW MGMT to BYOD" connection-state=\
    new dst-address=10.90.0.0/22 src-address=10.21.37.0/24
add action=accept chain=forward comment="!NEW BYOD to MGMT" connection-state=\
    established,related dst-address=10.21.37.0/24 src-address=10.90.0.0/22
add action=accept chain=forward comment="NEW MGMT to Company_1" \
    connection-state=new dst-address=10.100.0.0/23 src-address=10.21.37.0/24
add action=accept chain=forward comment="!NEW Company_1 to MGMT" \
    connection-state=established,related dst-address=10.21.37.0/24 \
    src-address=10.100.0.0/23
add action=drop chain=input
add action=drop chain=forward connection-state=\
    invalid,established,related,new,untracked
/ip firewall nat
add action=masquerade chain=srcnat out-interface=sfp28-1<-PCSS src-address=\
    10.21.37.0/24
add action=masquerade chain=srcnat out-interface=sfp28-2<-OPL src-address=\
    10.21.37.0/24
add action=masquerade chain=srcnat out-interface=sfp28-1<-PCSS src-address=\
    10.80.0.0/24
add action=masquerade chain=srcnat out-interface=sfp28-2<-OPL src-address=\
    10.80.0.0/24
add action=masquerade chain=srcnat out-interface=sfp28-1<-PCSS src-address=\
    10.90.0.0/24
add action=masquerade chain=srcnat out-interface=sfp28-2<-OPL src-address=\
    10.90.0.0/24
add action=masquerade chain=srcnat out-interface=sfp28-1<-PCSS src-address=\
    10.100.0.0/24
add action=masquerade chain=srcnat out-interface=sfp28-2<-OPL src-address=\
    10.100.0.0/24
/ip route
add check-gateway=ping distance=1 gateway=1.1.1.1 target-scope=30
add distance=1 gateway=192.168.43.2
add distance=2 gateway=192.168.10.1
add distance=1 dst-address=1.1.1.1/32 gateway=192.168.43.2
/system clock
set time-zone-name=Europe/Warsaw
/system identity
set name=MDF-RTR-2
/system ntp client
set enabled=yes primary-ntp=150.254.190.51 secondary-ntp=195.187.245.55
/system ntp server
set enabled=yes multicast=yes
/system scheduler
add interval=1m name=Script-NetWatch_check on-event=\
    "/system script run NetWatch_check\r\
    \n" policy=read,write,policy,test start-date=jan/01/2021 start-time=\
    00:00:00
/system script
add dont-require-permissions=no name=Backup owner=admin policy=\
    ftp,read,write,policy,test source=":global date [/system clock get date]\r\
    \n:global time [/system clock get time]\r\
    \n:global hostname [/system identity get name]\r\
    \n:global datetimestring ([:pick \$date 7 11] .\".\" . [:pick \$date 0 3] \
    .\".\" . [:pick \$date 4 6].\"-\".[:pick \$time 0 2].\".\".[:pick \$time 3\
    \_5])\r\
    \n\r\
    \n/export file=\"\$hostname_\$datetimestring.rsc\"\r\
    \n\r\
    \n:log info \"System Backup: Ongoing. Please wait!\"\r\
    \n:delay 30s\r\
    \n:log info \"System Backup: Sending to FTP Server\"\r\
    \n/tool fetch address=10.21.37.100 src-path=\"\$hostname_\$datetimestring.\
    rsc\" user=mikrotik password=mikrotik123! port=21 upload=yes ascii=no mode\
    =ftp dst-path=\"\$hostname_\$datetimestring.rsc\"\r\
    \n:delay 5s\r\
    \n:log info \"System Backup: Deleting Backup Files\"\r\
    \n/file remove \"\$hostname_\$datetimestring.rsc\"\r\
    \n:log info message=\"Successfully removed Temporary Backup Files\"\r\
    \n:delay 1\r\
    \n:log info \"System Backup: Done\"\r\
    \nquit"
/tool netwatch
add down-script="ip route disable [find dst-address=0.0.0.0/0 gateway=192.168.\
    43.2]\r\
    \n:log error \"PCSS' link is down!\"\r\
    \nip route disable [find dst-address=0.0.0.0/0 gateway=1.1.1.1]\r\
    \n/ip firewall connection remove [find]" host=1.1.1.1 interval=1s \
    up-script="ip route enable [find dst-address=0.0.0.0/0 gateway=192.168.43.\
    2]\r\
    \nip route enable [find dst-address=0.0.0.0/0 gateway=1.1.1.1]\r\
    \n:log error \"PCSS' link is up!\"\r\
    \n/ip firewall connection remove [find]"
add down-script=":log error \"PCSS' GW is down!\"\r\
    \n/ip firewall connection remove [find]" host=192.168.43.2 interval=1s \
    up-script=\
    ":log error \"PCSS' GW is up!\"\r\
    \n/ip firewall connection remove [find]"
/tool user-manager database
set db-path=user-manager
