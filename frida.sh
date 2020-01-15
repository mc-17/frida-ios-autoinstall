string=$(cat "/etc/apt/sources.list.d/cydia.list")
if [[ $string == *"build.frida.re"* ]]; then
  echo "frida source already in sources"
else
	echo "deb https://build.frida.re/ ./" >> "/etc/apt/sources.list.d/cydia.list"
fi

apt update

bitness=$(getconf LONG_BIT)
suffix=""

if [ "$bitness" -eq "64" ]; then
	echo "is 64 bit"
else
	suffix="32"
	echo "is 32 bit"
fi

apt install -y --allow-unauthenticated "re.frida.server$suffix"
