#!/opt/epd-7.0-1-rh5-x86_64/bin/python
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
  lowmin = 100000
  highmax = -lowmin
  count  = 0
  minexpress = lowmin
  maxexpress = 0
  countnegdiff = 0
  countposdiff = 0

  for i in range(0, len(epochnames)):
    if wt[epochnames[i]] != None:
      count += 1
      if (wt[epochnames[i]] > maxexpress):
        maxexpress = wt[epochnames[i]]
      if (wt[epochnames[i]] < minexpress):
        minexpress = wt[epochnames[i]]
      if (i > 0) :
        curdiff = wt[epochnames[i]] - wt[epochnames[i-1]]
        if (abs(curdiff) < lowmin):
          lowmin = abs(curdiff)
        if (abs(curdiff) > highmax):
          highmax = abs(curdiff)
        if (curdiff < 0):
          countnegdiff += 1
        elif (curdiff > 0):
          countposdiff += 1
  if (countposdiff == count):
    wt["consistent"] = 1
  elif (countnegdiff == count):
    wt["consistent"] = -1
  else :
    wt["consistent"] = 0

  # calculate log diffs
  if wt[epochnames[0]] != None and wt[epochnames[0]] != 0:
    if (wt[epochnames[1]] != None and wt[epochnames[1]] != 0):
      wt["logdiff6to3"] = math.log(wt[epochnames[1]] / wt[epochnames[0]])
    if (wt[epochnames[2]] != None and wt[epochnames[2]] != 0):
      wt["logdiff9to3"] = math.log(wt[epochnames[2]] / wt[epochnames[0]])
  if wt[epochnames[3]] != None and wt[epochnames[3]] != 0:
     if (wt[epochnames[4]] != None and wt[epochnames[4]] != 0):
       wt["logdiff18to12"] = math.log(wt[epochnames[4]] / wt[epochnames[3]])
     if (wt[epochnames[5]] != None and wt[epochnames[5]] != 0):
      wt["logdiff24to12"] = math.log(wt[epochnames[5]] / wt[epochnames[3]])
  wt["absmaxdiff"] = highmax
  wt["absmindiff"] = lowmin
  wt["minexpress"] = minexpress
  wt["maxexpress"] = maxexpress
  wt["numofexpress"] = count
  db.wts.save(wt)

