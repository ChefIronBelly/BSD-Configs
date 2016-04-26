#!/usr/local/bin/bash
# original source https://github.com/blamonet/bash-weather
# jsonval credit: https://gist.github.com/cjus/1047794
jsonval () {
temp=`echo $haystack | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w $needle`
        echo ${temp##*|}
}

dev_key='xxx'
zip_code='48328'
city='Waterford'
state='MI'

haystack=$(curl -Ls -X GET http://api.wunderground.com/api/$dev_key/conditions/q/$state/$city.json)
needle='temperature_string'

temperature=$(jsonval $needle $haystack)

needle='weather'
current_condition=$(jsonval $needle $haystack)

printf ' %s %s \n' \
	"Current Conditions:" "$current_condition" "$temperature"
