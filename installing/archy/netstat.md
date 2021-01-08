# netstat

`netstat` is a great tool to help troubleshoot / inspect what sockets are in-use.
`ss` is recommended to replace `netstat` but I still like `netstat`, fortunately some options are the same

## likely good enough

`sudo netstat --all --program | grep -i docker`
- sudo since root started the daemons
- `grep` for `docker` to filter the list

## options

| short  | long            | description                                      |
| ------ | --------------- | ------------------------------------------------ |
| -p     | --program       | show program name & PID                          |
|        |                 |                                                  |
| -l     | --listening     | show only listening sockets (omitted by default) |
| -a     | --all           | show both listening and non-listening sockets    |
|        |                 |                                                  |
| -n     | --numeric       | disable resolution of hosts, ports & usernames   |
|        | --numeric-hosts | disable resolution of hosts                      |
|        | --numeric-ports | disable resolution of ports                      |
|        | --numeric-users | disable resolution of users                      |
|        |                 |                                                  |
| -c     | --continuous    | refresh every second, think `watch`              |
| -e/-ee | --extend        | extended info, use 2x to max the info shown      |
| -v     | --verbose       | dump extra details                               |
|        |                 |                                                  |
| sudo   |                 | sudo prefix since root launched the processes    |
