#!/usr/pkg/bin/mksh
# wx_nyc.sh
curl --silent "http://weather.yahooapis.com/forecastrss?w=2515094&u=f" | awk -F '- '  '
/<title>/ { sub("</title>", "", $2) && l=$2 }
/<b>Forecast/ { getline; gsub("<.*", "", $2); printf("%s: %s\n", l, $2); exit }'
