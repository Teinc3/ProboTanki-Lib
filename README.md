# ProTanki Crystal Generator

## Features

### TankiProxy
A proxy server that can be used to intercept and modify packets sent to ProTanki servers. This is useful for debugging the protocol of the game.

### TankiBot
A bot containing watchdog and sheep sockets that can be used to automate the process of farming madness.


## Todo

- [ ] Update autorejoin to be timebased instead of countbased (3 discs within 5 second -> temporary pause, 3 temporary pauses within 5 minutes -> remvoal from queue)
- [ ] Distribute sheep to equailze number of teams using currently available spaces (instead of using index to determine team)
- [ ] Watchdog invites human observer account when creating private battles