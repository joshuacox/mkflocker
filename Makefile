trusty: /root/.trustyreadyforflocker /etc/apt/preferences.d/buildbot-700 /root/.trustyflockerinstalled

/etc/apt/preferences.d/buildbot-700:
	./preffer.sh

/root/.trustyreadyforflocker:
	date -I > /root/.readyforflocker
	sudo apt-get update
	sudo apt-get -y install apt-transport-https software-properties-common
	./preffer.sh

/root/.trustyflockerinstalled:
	sudo apt-get update
	sudo apt-get -y install --force-yes clusterhq-flocker-cli
