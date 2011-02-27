#!/opt/epd-7.0-2-rd5-x86_64/bin/python
import pymongo
import math

from pymongo import Connection


connection = Connection()
db = connection['#myapp-production']
epochnames = ["express3", "express6", "express9", "express12", "express18", "express24"]
total = 0
for wt in db.wts.find():
  total += 1
  if (total % 1000 == 0):
    print "total at: " + str(total)
    print wt["locus"]
  if wt["numofexpress"] != 6:
    continue
  lowmin = 100000
  highmax = -lowmin
  count  = 0
  minexpress = lowmin
  maxexpress = 0
  countnegdiff = 0
  countposdiff = 0

  skip = 0
  for i in range(0, len(epochnames)):
    if wt[epochnames[i]] == 0.00:
      skip = 1
      break
    count += 1
    if (i > 0):
      curdiff = wt[epochnames[i]] / wt[epochnames[i-1]]
      if (abs(curdiff - 1) < lowmin):
        lowmin = abs(curdiff - 1)
      if (abs(curdiff - 1) > highmax):
        highmax = abs(curdiff - 1)
      if (curdiff < 1):
        countnegdiff += 1
      elif (curdiff > 1):
        countposdiff += 1
  if (skip == 1):
    continue
  if (countposdiff == count - 1):
    wt["logconsistent"] = 1
  elif (countnegdiff == count - 1):
    wt["logconsistent"] = -1
  else :
    wt["logconsistent"] = 0

  wt["abslogmaxdiff"] = highmax
  wt["abslogmindiff"] = lowmin
  db.wts.save(wt)
