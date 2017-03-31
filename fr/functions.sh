#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file

jv_pg_ct_lejourdelasemainecest() {
say "La Météo de demain,..." 
meteo=`curl -s "http://api.wunderground.com/api/$weather_wunderground_key/forecast/lang:$weather_wunderground_language/q/$weather_wunderground_city.json" | jq -r '.forecast.txt_forecast.forecastday[1].fcttext_metric' | sed "s/ºC/degrés/g"`
ditmeteo
}


jv_pg_ct_meteoaujourdhui() {
say "La météo aujourd'hui,... " 
meteo=`curl -s "http://api.wunderground.com/api/$weather_wunderground_key/forecast/lang:$weather_wunderground_language/q/$weather_wunderground_city.json" | jq -r '.forecast.txt_forecast.forecastday[0].fcttext_metric' | sed "s/ºC/degrés/g"`
ditmeteo
}

ditmeteo() {
meteo=`echo "$meteo" | sed -e "s/mm/minimètre /g" | sed -e "s/ S / Sud /g" | sed -e "s/ SSE / Sud Sud Est /g"   | sed -e "s/ ONO / Ouest Nord Ouest /g" | sed -e "s/ SO / Sud Ouest /g" | sed -e "s/ SSO / Sud Sud Ouest /g"`
say "$meteo"

}