# feb/21/2021 14:20:24 by RouterOS 6.48.1
# software id = 
#
#
#
/interface bridge
add name=BR pvid=666 vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
set [ find default-name=ether9 ] disable-running-check=no
set [ find default-name=ether10 ] disable-running-check=no
set [ find default-name=ether11 ] disable-running-check=no disabled=yes
set [ find default-name=ether12 ] disable-running-check=no disabled=yes
set [ find default-name=ether13 ] disable-running-check=no disabled=yes
set [ find default-name=ether14 ] disable-running-check=no disabled=yes
set [ find default-name=ether15 ] disable-running-check=no disabled=yes
set [ find default-name=ether16 ] disable-running-check=no disabled=yes
set [ find default-name=ether17 ] disable-running-check=no disabled=yes
set [ find default-name=ether18 ] disable-running-check=no disabled=yes
set [ find default-name=ether19 ] disable-running-check=no disabled=yes
set [ find default-name=ether20 ] disable-running-check=no disabled=yes
set [ find default-name=ether21 ] disable-running-check=no disabled=yes
set [ find default-name=ether22 ] disable-running-check=no disabled=yes
set [ find default-name=ether23 ] disable-running-check=no disabled=yes
set [ find default-name=ether24 ] disable-running-check=no disabled=yes
set [ find default-name=ether25 ] disable-running-check=no disabled=yes
set [ find default-name=ether26 ] disable-running-check=no disabled=yes
set [ find default-name=ether27 ] disable-running-check=no disabled=yes
set [ find default-name=ether28 ] disable-running-check=no disabled=yes
set [ find default-name=ether29 ] disable-running-check=no disabled=yes
set [ find default-name=ether30 ] disable-running-check=no disabled=yes
set [ find default-name=ether31 ] disable-running-check=no disabled=yes
set [ find default-name=ether32 ] disable-running-check=no disabled=yes
set [ find default-name=ether33 ] disable-running-check=no disabled=yes
set [ find default-name=ether34 ] disable-running-check=no disabled=yes
set [ find default-name=ether35 ] disable-running-check=no disabled=yes
set [ find default-name=ether36 ] disable-running-check=no disabled=yes
set [ find default-name=ether37 ] disable-running-check=no disabled=yes
set [ find default-name=ether38 ] disable-running-check=no disabled=yes
set [ find default-name=ether39 ] disable-running-check=no disabled=yes
set [ find default-name=ether40 ] disable-running-check=no disabled=yes
set [ find default-name=ether41 ] disable-running-check=no disabled=yes
set [ find default-name=ether42 ] disable-running-check=no disabled=yes
set [ find default-name=ether43 ] disable-running-check=no disabled=yes
set [ find default-name=ether44 ] disable-running-check=no disabled=yes
set [ find default-name=ether45 ] disable-running-check=no disabled=yes
set [ find default-name=ether46 ] disable-running-check=no disabled=yes
set [ find default-name=ether47 ] disable-running-check=no disabled=yes
set [ find default-name=ether48 ] disable-running-check=no disabled=yes
set [ find default-name=ether49 ] disable-running-check=no
set [ find default-name=ether54 ] disable-running-check=no disabled=yes name=\
    qsfpplus1-1
set [ find default-name=ether55 ] disable-running-check=no disabled=yes name=\
    qsfpplus1-2
set [ find default-name=ether56 ] disable-running-check=no disabled=yes name=\
    qsfpplus1-3
set [ find default-name=ether57 ] disable-running-check=no disabled=yes name=\
    qsfpplus1-4
set [ find default-name=ether58 ] disable-running-check=no disabled=yes name=\
    qsfpplus2-1
set [ find default-name=ether59 ] disable-running-check=no disabled=yes name=\
    qsfpplus2-2
set [ find default-name=ether60 ] disable-running-check=no disabled=yes name=\
    qsfpplus2-3
set [ find default-name=ether61 ] disable-running-check=no disabled=yes name=\
    qsfpplus2-4
set [ find default-name=ether50 ] disable-running-check=no name=sfp-sfpplus1
set [ find default-name=ether51 ] disable-running-check=no name=sfp-sfpplus2
set [ find default-name=ether52 ] disable-running-check=no name=sfp-sfpplus3
set [ find default-name=ether53 ] disable-running-check=no name=sfp-sfpplus4
/interface vlan
add interface=BR mtu=1496 name=VLAN2137-MGMT vlan-id=2137
/interface bonding
add mode=802.3ad name=bonding-MDF-AGG-1 slaves=sfp-sfpplus1,sfp-sfpplus2
add mode=802.3ad name=bonding-MDF-AGG-2 slaves=sfp-sfpplus3,sfp-sfpplus4
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-2 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether2 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether3 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether4 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether5 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether6 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether7 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether8 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether9 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether10 pvid=666
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=BR tagged="BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2,ether1,ether2,eth\
    er3,ether4,ether5,ether6,ether7,ether8,ether9,ether10" vlan-ids=2137
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=70
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=80
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=90
add bridge=BR tagged=BR,bonding-MDF-AGG-1,bonding-MDF-AGG-2 vlan-ids=100
/ip address
add address=10.21.37.8/24 interface=VLAN2137-MGMT network=10.21.37.0
/ip dns
set servers=10.21.37.1
/ip route
add distance=1 gateway=10.21.37.1
/system identity
set name=IDF1-ACC-1P
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
