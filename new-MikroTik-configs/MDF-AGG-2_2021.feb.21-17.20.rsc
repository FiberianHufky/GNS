# feb/21/2021 17:20:18 by RouterOS 6.48.1
# software id = 
#
#
#
/interface bridge
add name=BR pvid=666 vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether26 ] disable-running-check=no name=qsfpplus1-1
set [ find default-name=ether27 ] disable-running-check=no name=qsfpplus1-2
set [ find default-name=ether28 ] disable-running-check=no name=qsfpplus1-3
set [ find default-name=ether29 ] disable-running-check=no name=qsfpplus1-4
set [ find default-name=ether30 ] disable-running-check=no name=qsfpplus2-1
set [ find default-name=ether31 ] disable-running-check=no name=qsfpplus2-2
set [ find default-name=ether32 ] disable-running-check=no name=qsfpplus2-3
set [ find default-name=ether33 ] disable-running-check=no name=qsfpplus2-4
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
set [ find default-name=ether14 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus13
set [ find default-name=ether15 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus14
set [ find default-name=ether16 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus15
set [ find default-name=ether17 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus16
set [ find default-name=ether18 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus17
set [ find default-name=ether19 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus18
set [ find default-name=ether20 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus19
set [ find default-name=ether21 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus20
set [ find default-name=ether22 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus21
set [ find default-name=ether23 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus22
set [ find default-name=ether24 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus23
set [ find default-name=ether25 ] disable-running-check=no disabled=yes name=\
    sfp-sfpplus24
/interface vlan
add interface=BR mtu=1496 name=VLAN2137-MGMT vlan-id=2137
/interface bonding
add mode=802.3ad name=bonding-IDF1-ACC-1P slaves=sfp-sfpplus5,sfp-sfpplus6
add mode=802.3ad name=bonding-IDF2-ACC-1P slaves=sfp-sfpplus7,sfp-sfpplus8
add mode=802.3ad name=bonding-IDF3-ACC-1P slaves=sfp-sfpplus9,sfp-sfpplus10
add mode=802.3ad name=bonding-IDF4-ACC-1P slaves=sfp-sfpplus11,sfp-sfpplus12
add mode=802.3ad name=bonding-MDF-ACC-1P slaves=sfp-sfpplus1,sfp-sfpplus2
add mode=802.3ad name=bonding-MDF-ACC-2 slaves=sfp-sfpplus3,sfp-sfpplus4
add mode=802.3ad name=bonding-MDF-AGG-1 slaves=\
    qsfpplus1-1,qsfpplus1-2,qsfpplus1-3,qsfpplus1-4
add mode=802.3ad name=bonding-MDF-RTR-1 slaves=qsfpplus2-1,qsfpplus2-2
add mode=802.3ad name=bonding-MDF-RTR-2 slaves=qsfpplus2-3,qsfpplus2-4
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-RTR-1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-RTR-2 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-AGG-1 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-ACC-1P pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-MDF-ACC-2 pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-IDF1-ACC-1P pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-IDF2-ACC-1P pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-IDF3-ACC-1P pvid=666
add bridge=BR frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=bonding-IDF4-ACC-1P pvid=666
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=BR tagged="BR,bonding-MDF-RTR-1,bonding-MDF-RTR-2,bonding-MDF-AGG-1\
    ,bonding-MDF-ACC-1P,bonding-MDF-ACC-2,bonding-IDF1-ACC-1P,bonding-IDF2-ACC\
    -1P,bonding-IDF3-ACC-1P,bonding-IDF4-ACC-1P" vlan-ids=2137
add bridge=BR tagged="BR,bonding-MDF-RTR-1,bonding-MDF-RTR-2,bonding-MDF-AGG-1\
    ,bonding-MDF-ACC-1P,bonding-MDF-ACC-2,bonding-IDF1-ACC-1P,bonding-IDF2-ACC\
    -1P,bonding-IDF3-ACC-1P,bonding-IDF4-ACC-1P" vlan-ids=70,80,90,100
/ip address
add address=10.21.37.5/24 interface=VLAN2137-MGMT network=10.21.37.0
/ip dns
set servers=10.21.37.1
/ip route
add distance=1 gateway=10.21.37.1
/system identity
set name=MDF-AGG-2
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
