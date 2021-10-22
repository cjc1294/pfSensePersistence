# Breakout
Service that will check if it can connect back to the listener periodically. If it can't, it will delete any filter rules blocking traffic to the red team network

## Deployment
 - Clear comments from breakout.sh: ```sed -ni '/\s# /!p' <script name>```
 - Set IP and port in breakout.sh
 - ```chmod +x breakout```
 - ```chmod +x breakout.sh```
 - Copy "breakout" to /etc/rc.d/router on target host
 - Copy "breakout.sh" to /usr/bin/router on target host (path can be changed in the "breakout" file)

## **Remember to clear comments when deploying**
```bash
sed -ni '/\s# /!p' <script name>
```

Additionally, the "PROVIDE", name, and description can be changed in the service file to blend into a system