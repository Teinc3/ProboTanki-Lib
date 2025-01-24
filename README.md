# ProboTanki
A collection of tools, scripts and clients for the game ProTanki. Portmantau of ProTanki and Robot.

## Features
### TankiProxy X GUI
A proxy server that can be used to intercept and modify packets sent to ProTanki servers.
This is useful for debugging the network protocol of the game and manipulating packets to achieve desired effects.
A GUI is provided to make logs easier to read.

### TankiBot
A bot containing a simple watchdog and sheep sockets, can be used to automate the process of farming multiple accounts at once.

### StaffScraper / ModChecker
A tool that scrapes the staff list from the ProTanki Wiki and checks if moderators (including admins) are online.
Can be extended to check for other players.

### NameStealer
A tool that can be used to search for available usernames on the ProTanki servers, and register them if they are available.

## Submodules
- ProTanki-Client-Code: Decompiled AS3 code of the ProTanki client.
- ProboTanki-Library: A common library of packets, codecs and networking utilities for ProboTanki

## Information
### Backend
A backend server is hosted on DigitalOcean and is used to host the above tools.
- Public IP: 34.209.240.121