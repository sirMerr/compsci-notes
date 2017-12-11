!!!note
    From https://jeegnathebug.github.io/miniature-pancake/datacomm.html#01
## Communication
Sending info from a sender to a receiver (Face-to-face conversation)

* 4 elements:
    1. Sender
    1. Medium
    1. Message
    1. Receiver
* 3 types
### Simplex
Communication in one direction

### Half Duplex (HDX)
Communication in both directions, but only one at a time
### Full Duplex (FDX)
Communication in both directions, at the same time (Most devices)

==FDX on a modem means the modem sends characters back for verification==

## Telecomm and Datacomm
### Telecomm (TC)
communication via electronic means (Telephone)
### Datacomm (DC)
communication where at least one end is a computer (IRC)

* Datacomm is a type of telecomm (which is a type of communication)
* Generally done with: packets/frames/blocks
* Protocol: set of rules governing transmission and reception of data between computers


## ISO / OSI model / architecture
**7 layers**

* Way to organize DC tasks in a clear way
* Most tasks are in one level; some in more than 1
* Protocols and configuration parameters must match at each level

|OSI Model||
|---|---|
|7|	Application Layer|
|6|	Presentation Layer|
|5|	Session Layer|
|4|	Transport Layer|
|3|	Netowrk Layer|
|2|	Data-link Layer|
|1|	Physical Layer|

==Acronym: All people seem to need data processing==

## Packet

Header layer (There's always a header)

Data	

Trailer layer (Usually not present)

* Headers and trailers control the info
The process of adding more and more info (headers) as you go down the OSI model is called ==PACKET ENCAPSULATION==

* The process of stripping headers is called ==DENCAPSULATION==
* At layer 1 (Physical layer), the data is sent away, or received

## DC Utilities

### ping
* Uses Internet Control Message Protocol (ICMP)
* Part of the Transmission Control Protocol (TCP) stack
* If the command works, it means up until layer 4, the two machines are the same
* "Timed out" (error) each protocol has a set timeout period
    * Where more time occurs between an event and the response event than expected

### tracert / traceroute (Linux)
* Shows the router path
* Internet traffic cops
* Looped pinging with increasing TTLs
* Sends packet to a router with TTL 
    1. Goes to 1 router, returns a message. Sends another packet with TTL 
    2. Goes to first, then second server. Returns info of second router

### TTL
* **Time to live**
* Like an expiry date
* In seconds or in router hops (u)

### pathping
* Like traceroute but with hundreds of packets

### ipconfig/ifconfig or ip (Linux)
* Shows your machine's DC info
* DNS caches data. Maintains information for speed
* ipconfig /release -> release DHCP lease
* ipconfig /renew -> get a new IP address
* ipconfig /displaydns -> displays DNS
* ipconfig /flushdns -> wipes cache data

### netstat
* Machine's TZP? info

### route
* Shows machine's routing tables

### arp
* **Address Resolution Protocol**
* Shows machine's ARP table
* Identifiers:
    * DNS translates between layer 5 to layer 4. (FQDN to IP)
    * ARP translates between layer 3 and 2. (IP to MAC address)

## Firewalls
* Watch all packets coming in and going out of the network
* Could be configured to reject ping, and/or some other kind of packet
* Could help stop DDos attacks

### DNS

* Translates an FQDN to an IP address

## Standards
* Two "types" of standards:
    * **Proprietary (Windows)**
    * **Open (C++, Linux distros)**
* Standards are good
* Standards are intellectual property

### Standards Bodies

* The ISO
    * Date format (yyyy-mm-dd)
* W3C
    * Web standards
* ACM
* IEEE
    * Hardware standards
    * IEEE 754: doubles, floats
    * IEEE 802.3: Ethernet
    * IEEE 802.5: Token Ring
    * IEEE 802.11: WiFi, radio

## Networks
### Network types

#### PAN
* Personal Area Networks
Bluetooth, NFC

#### LAN
* Local Area Networks
* Home setup
#### MAN
* Metropolitan Area Network
#### WAN
* Wide Area Networks
* Internet

### Network metrics

Metric -> standard for measurement

```
broadband (fast)      client-server
                 ^  ^
       wired <-  | /
   PAN  LAN  networking  MAN  WAN
   <---------          ---------->
               /   |  -> wireless
              v    v
            P2P   baseband (slow)
```

### Types of Nets

* Intranet
    * Network used strictly within an organisation
* Extranet
    * Network used strictly with some trusted outsiders (partners, suppliers, ...)
    * Like a DMZ
* Internet
    * Inter-networking. A network of networks

## Protocols
* RIP
    * Routing Information Protocol
    * Runs only on routers
    * Limits the number of routing loops
* SNMP
    * Simple Network Management Protocol
    * Manages and organises information about devices on the network
    * Network: set of nodes connected by edges
        * Nodes:
            * DTE: where data is displayed (like client machines and servers)
            * DCE: where data is transfered between machines, like routers and switches)
            * `traceroute` shows us some of this information
        * Edges:
            * DC links
    * Air-gapped/standalone machine
        * Not connected to any network
* IETF
    * DNS
    * TCP
    * SMTP
* Protocols are documented in what are called RFCs
    * RFC Editor

### Internet Protocol

* IPv4 - 32 bit
* IPv6 - 64 bit
* Port numbers

## Domain Names
* FQDN
    * Fully Qualified Domain Name
    * 2 flavours:
    * GTLD
        * Generic Top Level Domain Name
        * .com, .org, .edu
    * CCTLD
        * Country Code Top Level Domain Name
        * .ca, .us, .co.uk
    * ICANN
        * Internet Corporation of Assigned Names and Numbers
        * In charge of distributing domain names
    * IANA
    * Internet Assigned Numbers Authority
    * IPv4, IPv6
## A Concise Guide to the Major Internet Bodies
### LAN
* Characteristics
    * Typically housed in (part of) a building or building complex
    * Set of LAN segments (which can be connected)
* No license requirement from a regulatory body
* Shared by all DTEs and DCEs of the LAN transmission for baseband LANS have high quality medium
* Baseband LAN is one where you have one large wire that every DTE taps into
* MAC problem
    * Media Access Control
    * Packet collision
        * When two packets are sent at the same time from different computers
* MAC strategy
    * CSMA/CD-> Ethernet (Wired LAN)
        * If there are more nodes on the LAN segment, the odds of collisions are increased
        * Small amounts of nodes are better with ethernet, lots of nodes increase chance of collision, and therefore increase the response time
        * To avoid really high response times, create LAN segments (attached with the right DCE)
    * Token passing
        * The response time is rather flat even if there are a lot of nodes on LAN segment
        * There are never collisions because everything is done by one system
* Response time
    * (user and system can have a dialogue can interact) interactive systems
    * time
* response {begin/end}-time
    * Begins: hit `ENTER`
    * Ends: When data is received
* turn-around time: -> batch os
    * time job
    * returns: time job submitted
* availability
    * `(time available / stated time available) * 100`
* Usage
    * `(time used / time available) * 100`
* Throughput
    * Throughput = work/time (how much work you can do in a given amount of time)
    * Elevated throughput could equal elevated response time
* ==speed: bps==

## Topology
```
                                      o  o  o
                                       \ | /
                                       (hub)
                                       /   \
Ethernet   |  bus                |    o     o
           | (physical topology) | (star topology)
-----------+----------------------------------------
Token Ring | ring                | star
```

### UTP
* Ethernet wires
* Various grades/categories
    * CAT5
    * CAT6
* Hub
    * DCE that is a repeater of packets
    * Hub is a dumber switch
* Rationale for LANs
    1. Improved communication
    2. Ability to economically share valuable resources
        * File servers (H:/ Drive), print server, etc.
```
application   application
    v              v
 socket         socket
   \            /
    \          /
     \        /
 Layer 4    TCP
          v
 Layer 3     IP
```

## Socket
* Java Object
* Has 3 main parameters:
    * Protocol (TCP or UDP)
    * IP number
    * Port number
* One application can have many sockets
    * Like a web browser with multiple tabs open to different web servers
    * Port numbers are used to distinguish which application created which socket
!!!note
    * At layer 4 you operate "end-to-end" (end being the application that wanted the packet)
    * At layer 3 you operate "host-to-host" (host being any machine)

## TCP and UDP
|TCP|	UDP|
|---|---|
|<ul><li>port number</li><li>IP number (from layer 3)</li></ul>|<ul><li>port number</li><li>IP number</li></ul>|
|<ul><li>session/connection oriented</li><li> like a telephone conversation (waits for responses)</li></ul>|<ul><li>session/connection-less</li><li>like postal mail (sends a packet and that's it)</li></ul>|
|<ul><li>reliable</li><li>guaranteed delivery of packet</li><li>handles errors</li></ul>|<ul><li>not reliable</li><li>operates on a "best-efforts" basis</li><li>does not handle errors</li><li>packets can be lost, duplicated, corrupted, out of order</li></ul>|
|<ul><li>less "efficient"</li><li>time consuming when you wait for responses for every call</li></ul>|<ul><li>more efficient</li><li>it just sends the packets and doesn't give a shit afterward</li></ul>|
|<ul><li>does not neccessarily preserve packet write boundaries</li><li>TCP may do packet splitting or packet nagling or merging (changes the size of your packet by putting them together/taking them apart so that there is less to send over</li>|<li>does respect packet write boundaries</li><li>does not change the packet sizes</li><li>mainly because it doesn't give a shit|
|packets are arrays of bytes only</li>||

## Types of Messages

* unicast
    * 1-to-1
* multicast
    * 1-to-n (where n is not all)
* broadcast
    * 1-to-all machines on the network

!!!note 
    IP and UDP work in very similar fashion

    * UDP is better for broadcasting because you don't want responses from everyone about corrupted data, or received packets
        * Time-service apps
        * Real-time apps

## Servers
* Nodes are peers
* Peer to peer connections
    * DTE
        * **Data Terminal/Termination Equipment**
        * Client/Workstation
* DCE
    * Data Communication Equipment
    * Servers
        * File servers
            * $
            * NAS
                * **Network Attached Storage**
                * $$
                * Large file server with multiple HDDs
            * SAN
                * **Storage Area Network**
                * $$$
                * Fault-tolerance (something breaks, there's another one to take over)
                * Redundant components (computers, HDD controllers, HDD channels, HDDs)
                * Large
                * Expensive
                * Turnkey or self-created
                * Popular
* Print servers
    * Queue
    * FIFO structure
* Compute servers
    * Mainframes, clusters, ...
    * For number-crunching
    * Cluster: more than 1 computer acting as 1
* "Internet" servers
    * Email servers
    * FTP servers
    * Web servers
* "Infrastructure" Servers
    * The following servers basically make up the internet
    * Authentication servers
        * **3 A's of security**
            * ==Authentication==
                * Authentic -> original
            * ==Authorization==
                * Control of resource use
                * ACL
            * ==Auditing==
                * Logging
    * Modem Pool server
        * Obsolete
        * Server controlling many telephone modems
    * DNS servers
        * World wide distributed DBMS
        * Takes an FQDN and returns an IP address
    * Caching server
        * Remembers page data for speed
        > Gotta go fast 
        -**Sonic the Hedgehog**
    * DHCP servers
        * Dynamic Host Configuration Protocol
        * issues IP addresses ("leases")
        * Client machine broadcasts a message and DHCP is listening for that certain type of message. When DHCP finds the client's message, it gives it an IP address
    * Firewall server
        * Does packet filtering based on IP address, domain name, protocol, port, ...
        * Essential for security
    * Proxy Server
        * NAT
            * **Network Address Translation**
            * Takes an internal IP address and returns a public IP address
            * Outsiders never know inside IP numbers
            * Any organization can use the private IP's internally
            * Routers will drop all packets with private IP numbers as sending or destination IP numbers
        * PAT
            * **Port Address Translation**
            * Takes a public IP address and port number and returns a local IP address and port number
            * Increased security
            * "Increases" external IP address allocation
* ~50 clients per server

==HVAC: Server rooms use this==

## History
* 1440's
    * Gutenberg - movable-type printing press
* 1639
    * US government postal service
    * Given mail monopoly
    * Exclusive trading privilege
    * Two types of monopolies
        * Natural
    * Just happens because they're too good
    * "The company corners the market"
    * More than 50% of market shares
    * Google
    * Anti-trust laws
        * You can't be a monopoly, and if you are, we can fine you and shit
    * Artificial
        * Government gives monopoly
        * Done with oversight
        * Subject to public regulations via regulatory bodies
        * CRTC: Canadian Radio-Television Telecommunications
        * (US) FCC - Federal Communications Commission
    * Monopolies are contrary to public interest
        * Because they can increase prices of goods/services and screw with people
* 1800
    * France - Chappe Tower semaphore network
    * England - Murray Tower network used by British Admiralty
* 1837
    * Morse invents the telegraph
    * First major example of telecommunication
    * Morse code
        * Variable length
        * To differentiate characters
            * Count field
            * Delimeters
        * Shortest encodings given to most frequently used characters
* 1850
    * Western Union Corp. formed
    * Common communications carrier - privately-owned, publicly-accessible communication network
* 1876
    * Alexander Graham Bell demonstrates telephone
* 1877
    * Bell Tel. Co formed
* 1885
    * AT&T
        * American Telephone and Telegraph
    * Telco conglomerate begins
* 1898
    * Wireless Telegraph and Signal Co. formed
* 1901
    * Marconi - Transatlantic wireless broadcast
* 1947
    * AT&T Bell Labs invented transistor -> miniaturization
    * Like a Redstone Repeater
* 1959
    * Integrated circuit
    * Chip
* 1971
    * Intel microprocessor
    * CPU on a chip
* 1982
    * The AT&T divestiture

## Laws
### Intellectual property (IP) protection

#### Copyright
* Protects form, the actual words, sounds, images, etc.
####Patent
* Protects content, like algorithms, ideas, etc.
* Given a monopoly for a given time (~17 years)
#### Trademark
* Protects logos, slogans, characters, etc.
#### Trade secret
* Protects recipes, formulas, etc.

## Telephony
* Earliest networks: point-to-point
    * The more nodes you have, the more connections you have. Hard to scale
* Later: switchboard
    * However many nodes you have, that's how many connections you have
    * But you need a human to make connections between nodes
    * If you have way too many nodes, add another switchboard
* Tree structure
    * Having departments take care of certain tasks and then a department taking care of the other departments
* Telcos have very large UPS (uniterruptable power supply) systems
* Office -> ESS (electronic switching system) computer for telephony
* PBX (private branch exchange) -> private ESS
    * Like when you have a local phone line. A locale. 4-digit number that stays inside the building
* Telephone systems engineered for approximately 12% capacity
    * Only 12% of phones can be in use at once
    * Not 100% because it's expensive

## Ethernet
* Ethernet descriptions
* 10 BASE-T
* 10: speed in Mbps
* BASE: baseband signalling
* T: Medium-UTP
* 10 BASE 2
* 10 BASE 5
* 10 BASE T
* 100 BASE T
* 1000 BASE T
* 10G BASE T
* 100 BASE SX
* 40G BASE-CRX

## Signals
* Signals
    * Analogue: "continuous" (smooth)
* Versus
    * Discrete/digital
    * Only certain values allowed and nothing in between
    * Eg. 0 and 1

## Characteristics

###  Frequency
* Cycles per second measured in hertz (Hz)
* Each time the wave goes to zero, it is half a cycle

### Bandwidth
* Size of range of supported frequencies in a device
* POTS bandwidth
* 3100 Hz

### Band
    * Range of supported frequencies in a device
    * Eg. POTS (Plain old telephone service)
        * 300 - 3400 Hz
### Amplitude
* 1/2 * max(y-displacement)
* The distance between 0 and max, or 0 and min

### Phase
#### Definition 1
* Measure of signal synchronisation
* 2 signals are in phase when they are the same
* 2 signals are out of phase by a certain (0° to 360°) when they are not the same
#### Definition 2
* Phase change in 1 signal
* How much the phase skipped measured in degrees

## Bandwidth
* BPS ∝ Bandwidth
* baud = signalling rate `(signals/sec)`
* bps = `baud * bits/signal`
    * bps = baud if bits being sent because 1 bit being sent per second in one signal = 1 baud
    * `bits/signal = log(base 2)(number of signal state)`
* more than 1 bits/signal = multibit modulation

### Modulation

* AM Radio
* Amplitude Shift-Keying (ASK) same thing as AM
* Frequency modulation (FM)
* Phase modulation (PM)
* Change 0s and 1s to analogue
* High frequency = 1, low frequency = 0

### Nyquist's Theorem

`baud <= 2 * bandwidth` on an ideal channel (no noise) POTS -> 300 to 3100 Hz 6200 baud max

### Shannon's law

`bps = bandwidth * log(base 2)(1 + S/N))` where S/N is the signal to noise ratio

### Last mile problem

The connection between the client and the first office Not as fast as connections between offices To fix this, you would have to change every client-to-office (copper) connection medium to a better one like fibre optics

## Modem

* modulator/demodulator
* comp->modem->(weird swirly shit)->modem->computer
* changes signal from digital to analogue and vice-versa
* roll-off: when a digital signal loses it's squareness (sharpness)
* modulation: process of varying one signal (carrier signal) in accordance with another (data signal) in order to encode and transmit the data signal

## Factors causing distortion

* farther: higher error rates
* faster: higher error rates
* attenuation: loss of amplitude over distance and time
* delay: signal slows over time and distance
* these problems affect higher frequencies more than lower frequencies
* noise: generally random signals that interfere with the data signal
    * white/gaussian/thermal noise, due to molecular vibration
    * present in all matter
    * S/N: signal-to-noise ratio. Higher is better
* impulse noise: not random
    * HVAC - refrigerators, strong electric motors
    * There's a burst of radio waves when an electronic device turns on
    * like the noise you hear when you turn on a tube tv
* echoing
* crosstalk
    * inadequate insulation between media allowing "leakage" (induction) of signals into one another (also applies to radio)

## VPN
* **Virtual Private Network**
* Software
* Allows an external computer to pretend to be internal via an encrypted DC link

## Physical media

### Definitions

#### Multiplexxing
Combining multiple slow-speed channels into a high-speed channel and vice-versa
#### Mux
DCE layer 1 device
Allows volume discount savings
#### FDM
Frequency division multiplexers
#### TDM
Time division multiplexers

### Wired
1. open wire - older/rural
    * bare copper
    * strung from poles-performance affected by weather
2. twisted pair
    * UTP - copper pairs
    * twisted and insulated with plastic cladding
    * various grades (CAT5, CAT6)
    * can be grouped into larger cables
    * buried or strung
    * less susceptible to noise because of the twisting
3. Coaxial cables
    * copper wire in aluminum shielding cladded in plastic
    * at higher frequencies, crosstalk becomes a problem
    * solution: coax
4. Optic fibre
    * fibre optic cable
    * transluscent glass/plastic core surrounded by plastic
    * laser light travels down the core - straight (bundled into cables, buried for trans-oceanic) or bouncing
    * very high bandwidth
    * expensvie
    * more secure
    * excellent network "backbones"
<img src="https://jeegnathebug.github.io/miniature-pancake/data/datacomm/notes/img/em_spectrum.jpg">

Electromagnetic Spectrum

`bps ∝ baud ∝ bandwidth (Δ frequency)`

x-rays, gamma rays, cosmic rays are ionizing rays. They can penetrate human bodies and knock off ions from cells when they are splitting

## Wireless

* Radio
    * AM and FM broadcast good for 1-to-many entertainment but not for DC
* Terrestrial Microwaves (µ-wave)
    * 2-5 GHz
    * "Beam-radio". can be shaped into tight beams ≈ 5°
    * Can be focused to travel in a "line of sight"
    * Microwave repeater/relay towers
    * Must be close because
        * Low power used to avoid interference
        * Curvature of Earth
        * Noise due to moisture in atmosphere
* Satellite microwave
    * Comsats (Communication satellites)
    * Smart microwave mirror
    * Have multiple microwave transponders (transmitters/receivers)
    * Geosynchronous orbit at a height of approximately 22,300 miles
    * They need to be separated by about 3°
    * 3 needed to cover Earth, because if you had only 2, they could not communicate with each other
    * Less susceptible to moisture, because there is no moisture in space. There is nothing. Only pain.
    * Excellent for 1-to-many transmission
    * Microwave bandwidth can be multipluxed (muxxed/muxxing)
    * Good for "moving" applications like GPS or geological exploration
    * MEO's and LEO's
        * Low Earth Orbit satellites
        * Tried but not really successful
* Cellular phone technology
    * Urban/rural areas divided into "cells"
    * Each cell has cellular masts/antennae and a microcomputer controller
    * mobile technology. You can move around and still get the signal
    * "hand offs" between cells can cause protocol problems
    * Early generations used analogue tech, digital later
    * Advanced features
        * 2G
        * 3G
        * 4G
        * All IP
        * QoS-quality of service
        * Support fast-moving, mobile
        * Speeds: ≈1Gbps, ≈100Mbps
        * Uses microwaves: 2.4Ghz
        * Uses TDM and FDM
        * Uses MIMO (Multiple In - Multiple Out) antennae
        * Converging with wifi and wiMac
* WiFi and WLANs
    * A, B, G, N
    * unlicensed
    * low power
    * supports mobile
    * 2.5GHz or 5GHz
    * ≤ 600 Mbps
    * indoor: ≈70m
    * outdoor: ≈250m
    * FDM used
    * Variation of CSMA/CD used (prevents collisions)
    * Topologies
        * IBSS - NIC to NIC
        * BSS - Access point to wireless router and 1 or more NICs
        * ESS - > 1 BSS
    * Uses MIMO
    * Uses spread spectrum frequency hopping
    * Out of the box/clean install WiFi security is terrible. Must be enhanced
    * Enhancements
        * Static IPs -> change to dynamic
        * MAC filtering
        * WEP -> Do not use. Use WPA2
        * Disable Access Point broadcast
    * WiMAX
        * Worldwide interoperability for microwave access
    * WMAN
        * Licensed/unlicensed
        * <= 100 Mbps - mobile
        * <= 1 Gbps - stationary
        * <= 50 km
        * 2 to 66 GHz
        * not CSMA/CD - prevents strategy
        * FDM and TDM
        * AM and PM
        * MIMO
* DSC and Cable modems
    * Digital subscriber line (telcos)
    * Various types - most common -> ADSL asymmetric
        * More bandwidth devoted to downlink (downloading) than uplinking, so it's asymmetric

```
home/office                           local office
  8KHz - 1MHz
_______|_____                        __________
| ADSL modem | ______local loop______| DSLAM  |
|____________|                       | ESS    |
                                     |________|
```

### Switch

* Layer 2+
* DCE replacing hubs
* Learns MAC address to port #
* Mappings to minimise broadcasts and collisions

### VLAN
* Virtual LAN
* Separating sets of ports into well-segregated sub-LANs

Physical plant = the actual systems that are needed, like the computers, the cooling systems, etc.

## Data Codes
* Encoding characters into bytes
* ASCII - 7 databits + 1 paritybit per byte
* Extended-ASCII - 8 databits per byte
    * PCs
    * Most computer hardware had it built-in
* EBCDIC -> 8 databits per character
    * IBM Mainframes
* Unicode -> 2+ bytes
    * Modern
    * Needed because Asian languages don't use characters, but rather idiograms (sounds and words) as their alphabet

## Data Integrity Checks
* 2 major strategies for dealing with errors:

### Detect and retransmit
* Consequences
* Buffer (an area of RAM used for I/O) management is complex especially for FDX
* Timeouts are important
* Number of retries must be limited

### Parity Checking
* VRC (Vertical redundancy check
* even/odd/mark/space/none -> same-effectiveness, useless
* older
* Add 1 bit to every character
* Sender: number of 1 bits in data bits is totalled. If odd-P is used, and number is odd, set parity bit to 0, otherwise set it to 1.
* Receiver: Total number of 1 bits in entire char. If odd-P is used, and result is odd, probably no errors. Otherwise, errors

### Checksum

* Block/Packet/Frame checking
* CHECKSUM-16, -32, ...
* Used by TCP
* Sender: treat all bytes in packet as integers. Add all together, keeping only the least-significant 16(32,000) bits of the sum. Include the 16,000/32,000 bits in the packet header.
* Receiver: Do the same additions as the sender. If computed sum bits = sent sum bits, probably ok. Otherwise, ye fucked up

### CRC (Cyclic Redundancy Checking)
* Polynomial Checking
* Modern
* Widely used
* Very effective
* Pick a `"binary polynomial"/binary number (x^16 + x^15 + x^2 + 1 = 11000000000000101)`, prime integer, ...
* Sender: treat each block as a large binary number. Divide the block by the prime and record the remainder. Send the 16 (32,000)-bit remainder in the header
* Receiver: do the same division. If computed remainder = sent remainder, probably ok. Otherwise, ye fucked up

### FEC (Forward error-correction)
* Sufficient extra bits are added to the packet after it has gone through the aforementioned error checks so that some errors can be detected and corrected at receiver
* Used where time delays are unacceptable
* Deep space stuff
* Used where bits are inexpensive
* DVD, CD, disk

sliding window algorithm allows a maximum of N outstanding unacknowledged packets

## Data compression
* "Squeezing" info into a more compact form
* 2 main strategies
    * Run-length encoding
    * Older
    * AABAAAAA -> AAB*5A
    * - escape character
    * 5 - length
    * A - repeated character
* Statistical encoding
    * assign shortest encoding to most-frequently occurring characters + dynamic dictionaries + ...
    * LZ algorithms
    * LZH
    * ZIP

```
Not compressed					Compressed
Video	Graphic/Image	Music/Sound	Text	Executable files	Compressed files
Highly compressible					Not compressible Video graphic/image sound/music text exec. files compressed files Highly compressible Not compressible 
```
<--------------------------------------------------------------------------> Compression ratio is calculated by: original file size / compressed file size. Effective bps = physical bps * compression ratio. Pros: - DataComm speed - Secondary storage Cons: - Time it takes to compress and decompress Lossy versus Lossless

### Lossy
Compressing a file and then decompressing it will result in a different file, but the difference between the two will not be noticeable

### Lossless
Compressing a file and then decompressing it will result in the exact same file

## Encryption
* Changing/hiding info so that it is indeciphirable to anyone but the intended recevier
* Cryptology
* Making secret messages
* Steganography (hiding)
* Cryptography
* Substitution (Change symbols)
* Transposition (Shuffle symbols)
* Cryptanalysis (breaking secret messages
* Plain text -> encryption algorithm -> cipher text -> decryption algorithm -> plain text

### Subtitution

ex. ABC...XYZ CDE...ZAB key: +2 CAT -> FCV

### Transposition

* Plain text length / key length = chars per column
* Key is looked at in alphabetical order
* Keys are the most vital and weakest point of encryption

ex. Plain text: `JOESENTME`

```
Key:	4. P	3. O	1. E	2. M	5. S
1	J	O	E	S	E
2	N	T	M	E	
* Result: EMSEOTJNE*
```

### Cryptanalysis

* Statistical/frequency attack
* The more cipher text that is captured, the more likely it is to be broken
* Changing keys often makes text harder to break
* Longer keys are harder to break
US - NSA (National Security Agency) UK - GCHQ (Government Communications Headquarters) Canada - CSE (Communications Security Establishment)

## Routers
* DCE - layer 3
( General purpose computers + *nix usually + routing protocols + multiple "interfaces"
"gateway"
* responsible for packet path selection and forwarding
small ($) to large ($$$)
workstation get e.g. URL with FQDN and port number from user
* IP number = DNS(FQDN)
* DNS Clients are called resolvers -> web browser is a DNS client/resolver
* Destination MAC address?

```
if ((workstation-IP number & subnetmask) == (destination-IP# & subnetmask))
    then destination-MAC-address = ARP(IP) 
else 
    destination-MAC-address = ARP(default gateway IP address)
```
 -> this is cached so it never has to do it again end if

## Cloud computing
e.g. Amazon,, AWS, MS Azure, Google
```
                    SaaS
                      ^
                      |         __________ community
                      |        /
                      | hybrid
private    <--------------+------------>public         delivery/deployment model
                      | PaaS          \
                      |                --------------> metered CPU/HD/networking at a 
                      |                             reasonable cost. Good security,
                      |                              reliable, scalable
                     \/
                    Iaas
               service model
```
## Service Model

IaaS -> infrastructure as a Service
Bare machine (physical or VM) and optional OS
PaaS -> Platform as a Service
Bare machine and OS and some software (Web server, FTP server)
SaaS -> Software as a Service
Bare machine and OS and lots of software (MS Office, Google Chrome)

## Switches
Switch parts can be segmented to create VLANs -> virtual LANs - packets are not transmitted between VLAN's

**VPN** -> Virtual Private Network-> encrypted software channel that allows an external machine to be "inside" an organization's externet network

_Not in Exam_
## Nyquist's Theorem

A bandwidth W can signal at max baud rate of 2W, on an ideal noiseless channel

**Baud <= 2W**

## Shannon's Law
`c = 2Wlog2(1+S/N)`

Where 
- `c` -> bps
- `W` -> bandwith
- `S/N` -> Channel signal-to-noise ratio

## Final
- All material in the term
- Short-medium answers
- Like the midterm
- All lab material from beginning to multi-threading
- About 50 questions (a bit more)
- 2 hour exam