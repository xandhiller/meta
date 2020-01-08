#! /usr/bin/python

import sqlite3
import pandas as pd
import datetime

username = 'alexanderhiller'

conn = sqlite3.connect('/Users/' + username + '/Library/Messages/chat.db')
c = conn.cursor()

for i in range(1000):
    cmd1 = 'SELECT ROWID, text, handle_id, \
                datetime(date + strftime(\'%s\',\'2001-01-01\'), \'unixepoch\') as date_utc \
            FROM message T1 \
            INNER JOIN chat_message_join T2 \
                ON T2.chat_id='+ str(i)+ '\
                AND T1.ROWID=T2.message_id \
            ORDER BY T1.date'
    c.execute(cmd1)
    df_msg = pd.DataFrame(c.fetchall(), columns=['id', 'text', 'sender', 'time'])

    df_msg.to_csv("sqliteOutput_" + str(i) + ".csv")
