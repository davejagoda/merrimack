#!/bin/bash
# version 0.1
# snapshot shell script, call from cron daily

TopLevelSnapshotDirectory="$HOME/merrimack/snapshot"
if [ ! -d $TopLevelSnapshotDirectory ]; then
    echo 'no top level snapshot directory, creating'
    mkdir -p $TopLevelSnapshotDirectory
fi

source ~/venv/moave/bin/activate
export PYTHONIOENCODING=utf8
~/src/github/proggy/python/iso3166-1.py > $TopLevelSnapshotDirectory/iso3166-1.`date "+%Y-%m-%dT%H:%M:%S%z"`.snapshot
~/src/github/proggy/python/iso3166-2.py > $TopLevelSnapshotDirectory/iso3166-2.`date "+%Y-%m-%dT%H:%M:%S%z"`.snapshot
~/src/github/proggy/python/kyoiku_kanji.py -0 > $TopLevelSnapshotDirectory/kyoiku_kanji.`date "+%Y-%m-%dT%H:%M:%S%z"`.snapshot
