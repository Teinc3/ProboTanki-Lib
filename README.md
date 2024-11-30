# ProTanki Crystal Generator

## Features

### TankiProxy
A proxy server that can be used to intercept and modify packets sent to ProTanki servers. This is useful for debugging the protocol of the game.

### TankiBot
A bot containing watchdog and sheep sockets that can be used to automate the process of farming madness.


## Documentation
### Statuses

What are statuses? They are essentially global notifiers that indicate a generic status of a player that you have subscribed to.
Statuses are always sent over. It does not matter if you are in a battle, the garage or lobby.

To subscribe to a player, and therefore receive their statuses, you must send a [`Subscribe_Status`](src/lib/packets/status/subscribestatus.py) packet to the server containing the player's username.
This way, you will receive a barrage of Status packets, including battle status, rank, premium and online information, etc, whenever there is a change in the player's status.


## Todo

- ~~[ ] Distribute sheep to equailze number of teams using currently available spaces (instead of using index to determine team)~~
- [ ] Watchdog invites human observer account when creating private battles