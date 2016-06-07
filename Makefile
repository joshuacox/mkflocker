client: trusty-client

node: trusty-node

trusty-client: ubuntuprep /etc/apt/preferences.d/buildbot-700 /etc/apt/preferences.d/buildbot-700 /root/.trustyflockerinstalled

trusty-node: ubuntuprep /etc/apt/preferences.d/buildbot-700 /etc/apt/preferences.d/buildbot-700 /root/.trustyflockernodeinstalled

ubuntuprep:
	sudo apt-get update
	sudo apt-get -y install apt-transport-https software-properties-common

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
	date -I > /root/.trustyflockernodeinstalled

clean:
	-@sudo apt-get -y purge --force-yes clusterhq-flocker-cli
	-@rm /root/.trustyflockerinstalled
	-@rm /root/.trustyreadyforflocker
	-@rm /etc/apt/preferences.d/buildbot-700
