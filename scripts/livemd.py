#! /home/alex/anaconda3/bin/python3.7

import os
import sys

################################################################################

def notifySend(string):
  os.system('notify-send "' + string + '"')

def silentExecute(cmd):
  os.system('nohup ' + cmd + ' 2> /dev/null > /dev/null &')

################################################################################
fullPath  = sys.argv[1]
fileName  = fullPath.split('/')[-1]
swpFile   = '.' + fileName + '.swp'
pathHead  = fullPath.split(fileName)[0]

command = 'echo ' + fullPath + \
         ' | entr pandoc -f markdown ' +  \
         fullPath + ' -o /tmp/livemd.pdf'

openCommand = 'zathura /tmp/livemd.pdf'

silentExecute(command)
silentExecute(openCommand)
