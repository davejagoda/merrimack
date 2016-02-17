#!/bin/sh
# version 0.1
# main shell script, suitable for calling from cron

TopLevelLogDirectory="$HOME/merrimack/log"
if [ ! -d $TopLevelLogDirectory ]; then
    echo 'no top level log directory, creating'
    mkdir -p $TopLevelLogDirectory
fi
echo $TopLevelLogDirectory

for domain in `grep -v ^\# domains.txt`
do
    echo $domain
    DomainDirectory="$TopLevelLogDirectory/$domain"
    if [ ! -d $DomainDirectory ]; then
        echo 'no domain directory, creating'
        mkdir -p $DomainDirectory
    fi
    echo 'http'
    curl -s $domain >> "$DomainDirectory/http`date "+%Y-%m-%dT%H:%M:%S%z"`.log"
    echo 'dns'
    dig $domain ANY >> "$DomainDirectory/dns`date "+%Y-%m-%dT%H:%M:%S%z"`.log"
done
