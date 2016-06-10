client: trusty-client

node: trusty-node

trusty-client: ubuntuprep /etc/apt/preferences.d/buildbot-700 /etc/apt/preferences.d/buildbot-700 /root/.trustyflockerinstalled

debian-client: debprep  /root/.debianflockerinstalled

trusty-node: ubuntuprep /etc/apt/preferences.d/buildbot-700 /etc/apt/preferences.d/buildbot-700 /root/.trustyflockernodeinstalled

ubuntuprep: debprep

debprep:
	sudo apt-get update
	sudo apt-get -y install apt-transport-https software-properties-common
	sudo apt-get -y install gcc libffi-dev libssl-dev python2.7 python2.7-dev python-virtualenv

/etc/apt/preferences.d/buildbot-700:
	./preffer.sh
	date -I > /root/.trustyreadyforflocker

/root/.trustyflockerinstalled:
	sudo apt-get update
	sudo apt-get -y install --force-yes clusterhq-flocker-cli
	date -I > /root/.trustyflockerinstalled

/root/.trustyflockernodeinstalled:
	sudo apt-get update
	sudo apt-get -y install --force-yes clusterhq-flocker-node
	sudo apt-get install -y clusterhq-flocker-docker-plugin
	date -I > /root/.trustyflockernodeinstalled

clean:
	-@sudo apt-get -y purge --force-yes clusterhq-flocker-cli
	-@rm /root/.trustyflockerinstalled
	-@rm /root/.trustyreadyforflocker
	-@rm /etc/apt/preferences.d/buildbot-700

/root/.debianflockerinstalled:
	virtualenv --python=/usr/bin/python2.7 flocker-client
	source flocker-client/bin/activate
	pip install --upgrade pip
	pip install https://clusterhq-archive.s3.amazonaws.com/python/Flocker-1.12.0-py2-none-any.whl
	date -I > /root/.debianflockerinstalled
	source flocker-client/bin/activate; flocker-ca --version
