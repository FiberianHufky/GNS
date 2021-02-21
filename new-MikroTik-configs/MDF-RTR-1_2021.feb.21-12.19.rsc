# feb/21/2021 12:19:01 by RouterOS 6.48.1
# software id = 
#
#
#
/interface bridge
add name=BR pvid=666 vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether14 ] disable-running-check=no name=sfp-sfp281
set [ find default-name=ether15 ] disable-running-check=no name=sfp-sfp282
set [ find default-name=ether2 ] disable-running-check=no name=sfp-sfpplus1
set [ find default-name=ether3 ] disable-running-check=no name=sfp-sfpplus2
set [ find default-name=ether4 ] disable-running-check=no name=sfp-sfpplus3
set [ find default-name=ether5 ] disable-running-check=no name=sfp-sfpplus4
set [ find default-name=ether6 ] disable-running-check=no name=sfp-sfpplus5
set [ find default-name=ether7 ] disable-running-check=no name=sfp-sfpplus6
set [ find default-name=ether8 ] disable-running-check=no name=sfp-sfpplus7
set [ find default-name=ether9 ] disable-running-check=no name=sfp-sfpplus8
set [ find default-name=ether10 ] disable-running-check=no name=sfp-sfpplus9
set [ find default-name=ether11 ] disable-running-check=no name=sfp-sfpplus10
set [ find default-name=ether12 ] disable-running-check=no name=sfp-sfpplus11
set [ find default-name=ether13 ] disable-running-check=no name=sfp-sfpplus12
/interface vlan
add interface=BR mtu=1496 name=VLAN70-Printers vlan-id=70
add interface=BR mtu=1496 name=VLAN80-Guest vlan-id=80
add interface=BR mtu=1496 name=VLAN90-BYOD vlan-id=90
add interface=BR mtu=1496 name=VLAN100-Company_1 vlan-id=100
add interface=BR mtu=1496 name=VLAN2137-MGMT vlan-id=2137
/interface bonding
add mode=802.3ad name=bonding-MDF-AGG-1 slaves=sfp-sfpplus1,sfp-sfpplus2
add mode=802.3ad name=bonding-MDF-AGG-2 slaves=sfp-sfpplus3,sfp-sfpplus4
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
add name=Pool-Guest ranges=10.80.0.10-10.80.2.128
add name=Pool-BYOD ranges=10.90.0.10-10.90.2.128
add name=Pool-Company_1 ranges=10.100.0.10-10.100.0.255
/ip dhcp-server
add address-pool=Pool-Guest disabled=no interface=VLAN80-Guest lease-time=15m \
    name=DHCP-Guest
add address-pool=Pool-BYOD disabled=no interface=VLAN90-BYOD lease-time=1d \
    name=DHCP-BYOD
add address-pool=Pool-Company_1 disabled=no interface=VLAN100-Company_1 \
    lease-time=1d name=DHCP-Company_1
/dude
set enabled=yes
/interface bridge port
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-2 pvid=666
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 untagged=ether1 \
    vlan-ids=2137
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=70
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=80
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=90
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=100
/interface list member
add interface=sfp-sfp281 list=WAN
add interface=sfp-sfp282 list=WAN
/ip address
add address=10.21.37.2/24 interface=VLAN2137-MGMT network=10.21.37.0
add address=10.21.37.1 interface=VRRP2137-MGMT network=10.21.37.1
add address=10.70.0.1 interface=VRRP70-Printers network=10.70.0.1
add address=10.70.0.2/24 interface=VLAN70-Printers network=10.70.0.0
add address=10.80.0.1 interface=VRRP80-Guest network=10.80.0.1
add address=10.80.0.2/22 interface=VLAN80-Guest network=10.80.0.0
add address=10.90.0.1 interface=VRRP90-BYOD network=10.90.0.1
add address=10.90.0.2/22 interface=VLAN90-BYOD network=10.90.0.0
add address=10.100.0.1 interface=VRRP100-Company_1 network=10.100.0.1
add address=10.100.0.2/23 interface=VLAN100-Company_1 network=10.100.0.0
/ip dhcp-client
add disabled=no interface=sfp-sfp281
add disabled=no interface=sfp-sfp282
/ip dhcp-server network
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
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN src-address=\
    10.21.37.0/24
/system identity
set name=MDF-RTR-1
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
