#!/usr/bin/env bash

# jsonval credit: https://gist.github.com/cjus/1047794
jsonval () {
temp=`echo $haystack | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w $needle`
        echo ${temp##*|}
}

dev_key='8b3d165d639ff3a8'
zip_code='48328'
city='Waterford'
state='MI'
red=$(tput setaf 1)
textreset=$(tput sgr0)

haystack=$(curl -Ls -X GET http://api.wunderground.com/api/$dev_key/conditions/q/$state/$city.json)
needle='temperature_string'

temperature=$(jsonval $needle $haystack)

needle='weather'
current_condition=$(jsonval $needle $haystack)

#echo -e '\n' $red $current_condition 'and' $temperature $textreset '\n'
printf ' %s %s \n' \
	"Current Conditions:" "$current_condition" "$temperature"
