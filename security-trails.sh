#!/bin/bash

#config
APIKEY='xxxxxxxxxxxx'
#endconfig

read -p "[script@bash]# input domain name: " domainname;
echo ''

echo "subdomains $domainname: "
echo '"'
curl -s --request GET --url "https://api.securitytrails.com/v1/domain/$domainname/subdomains?children_only=true&include_inactive=true" --header "APIKEY: $APIKEY" --header 'Accept: application/json'  | jq -r '.subdomains[] + "'.$domainname'"'
echo '"'