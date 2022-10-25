import csv,os, sys, json, io, math

def getColumnFor(colName, row):
  index = 0
  for thisName in row:
    if thisName.strip() == colName.strip():
      return index
    else:
      index +=1   
  return index

def writeObjectiveToOutfile(key, val):
  parsed_json = {}
  
  if os.path.isfile(objectivesFile):
    json_data = open(objectivesFile)
    parsed_json = json.load(json_data)

    parsed_json[key] = val

    dataString = json.dumps(parsed_json, sort_keys=True,indent=4, separators=(',', ': '))

    with io.open(objectivesFile, 'w', encoding='utf-8') as f:
      f.write(str(dataString))

def loadCSV(f):
  with open(f, 'rU') as infile:
    # read the file as a dictionary for each row ({header : value})
    reader = csv.DictReader(infile)
    data = {}
    for row in reader:
      for header, value in row.items():
        try:
          data[header.strip()].append(float(value))
        except KeyError:
          data[header.strip()] = [float(value)]
    return data 
    
resultsFileName = "results.csv"
resultsFile = sys.argv[1] + os.path.sep + resultsFileName
objectivesFileName = "objectives.json"
objectivesFile = sys.argv[1] + os.path.sep + objectivesFileName
objectiveName = sys.argv[2]
print(objectiveName)
scenarioDataFolder = sys.argv[3]
xlead = sys.argv[4]
xfoll1 = sys.argv[5]
xfoll2 = sys.argv[6]
xfoll3 = sys.argv[7]
xfoll4 = sys.argv[8]
time = sys.argv[9]
target = sys.argv[10]

results = loadCSV(resultsFile)

points = zip(results[xlead],results[xfoll1],results[xfoll2],results[xfoll3],results[xfoll4],results[time],results[target])

#print("target = ", target)
#print("Time = ", time)

def error(T):
  #diff = time*(abs(abs(T[0] - T[1]) - target) + abs(abs(T[1] - T[2]) - target) + abs(abs(T[2] - T[3]) - target) + abs(abs(T[3] - T[4]) - target))
  #print( T[0], T[1], T[2], T[3], T[4], T[5], T[6])
  diff = T[5]*(abs(abs(T[0] - T[1]) - T[6]) + abs(abs(T[1] - T[2]) - T[6]) + abs(abs(T[2] - T[3]) - T[6]) + abs(abs(T[3] - T[4]) - T[6]))
#  print("Risultato: ", diff)
  return diff

'''
finalMap = set(map(error,points))
#print("Final map: ", finalMap )
print("Max: ", max(finalMap) )
print("Median: ", statistics.median(finalMap) )
writeObjectiveToOutfile(objectiveName, max( finalMap ) )
#writeObjectiveToOutfile(objectiveName, statistics.median(finalMap) )
'''

writeObjectiveToOutfile(objectiveName, max(map(error,points)))

