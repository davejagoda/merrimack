#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re, os, sys, time, platform, httplib
import gdata.spreadsheet.service

u = os.getenv('GoogleDocsUserName')
p = os.getenv('GoogleDocsPassWord')
if u == None:
    print('set the GoogleDocsUserName environment variable')
    sys.exit(1)
if p == None:
    print('set the GoogleDocsPassWord environment variable')
    sys.exit(1)
if len(sys.argv) != 3:
    print('provide exactly two arguments')
    sys.exit(1)

print('connecting to Google')
gd_client = gdata.spreadsheet.service.SpreadsheetsService()
gd_client.email = u
gd_client.password = p
gd_client.source = 'merrimack'
gd_client.ProgrammaticLogin()

q = gdata.spreadsheet.service.DocumentQuery()
q['title-exact'] = 'true'
q['title'] = sys.argv[1]
feed = gd_client.GetSpreadsheetsFeed(query=q)
if (len(feed.entry) != 1):
    print('number of matching spreadsheets is not 1')
    print(q['title'])
    print
    for e in feed.entry:
        print(e)
        print
    sys.exit(1)

spreadsheet_id = feed.entry[0].id.text.rsplit('/',1)[1]
feed = gd_client.GetWorksheetsFeed(spreadsheet_id)
worksheet_id = feed.entry[0].id.text.rsplit('/',1)[1]
rows = gd_client.GetListFeed(spreadsheet_id, worksheet_id).entry

#now = time.strftime('%Y-%m-%dZ%H:%M:%S')
now = time.strftime('%Y-%m-%d %H:%M:%S')

url = sys.argv[2]
hostname = platform.node()

conn = httplib.HTTPConnection(url)
conn.request('GET', '/')
resp = conn.getresponse()

dict = {'datetime': now,
        'hostname': hostname,
        'url': url,
        'status': str(resp.status)}
print(dict)
entry = gd_client.InsertRow(dict, spreadsheet_id, worksheet_id)
if isinstance(entry, gdata.spreadsheet.SpreadsheetsList):
    print('Insert row succeeded.')
else:
    print('Insert row failed.')
print('done')
