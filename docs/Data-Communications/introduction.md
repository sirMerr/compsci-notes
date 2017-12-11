## Important
There are no notes but class notes, so this will not be updated as much. All assignments will be up to date though.

## DTE & DCE
* data terminal equipment
* data communications equipment

# Network Utilities
## Protocol and Pinging
Set of rules governing sending and receiving packets

### Ping
Ping can be used for diagnosing if a website is down or for self diagnosis.

```bash
$ ping 127.0.0.1
$ ping localhost

// Response
64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.053 ms
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.044 ms
^C
--- localhost ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.044/0.049/0.053/0.004 ms
```

#### timeout
More time elapsed between an event and a response event than expected

### 127.0.0.1 and localhost
This refers to yourself. So if you ping that, you're pinging yourself. 

### FQDN
Fully Qualified Domain Name --> `www` like from `www.microsoft.com`
* It's not 1 machine for 1 FQDN
* It's possible to have more than 1 FQDN on a machine
* Opposite also possible, common for big sites

### DNS
* Important service that serves as a resolver. 
* You take a FQDN, give it to DNS to resolve and it gives an ip number. 
* You can do the inverse too.
* `IP# = DNS(FQDN)`

### tracert 

### strace route
Shows router path from sender to receiver --> looked pinging with increasing TTLs (time to live)

### pathping

### ipconfig
* Tells you a lot about yourself. 
* `/all` is all information
* `/displaydns` cacheing
* `/flushdns` casheing
* `/release` -- gave up DHCP lease
    * Dynamic Host Configuration Protocol
* `/reverse`

### netstat
* `-e`
* `-a`
* Info on TCP activity
    * TCP is an important protocol
* Advanced

### route print
    routing
    table info

## Identifiers
| Levels | Identifiers |
| ------ | :---------: |
| 7      | 6           |
| 6      | FQDN        |
| 5      |             |
|        | ^ dns v         |
| 4      | port #      |
| 3      | IP #        |
|        | ^ arp v        |
| 2      |             |
| 1      | MAC address |


