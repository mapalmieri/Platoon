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
  #with open(f, 'rU') as infile:
  with open(f, 'r') as infile:
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
accfoll1 = sys.argv[4]
accfoll2 = sys.argv[5]
accfoll3 = sys.argv[6]
accfoll4 = sys.argv[7]
time = sys.argv[8]

#print(accfoll1, accfoll2, accfoll3, accfoll4, time)

results = loadCSV(resultsFile)

#points = zip(results[accfoll1],results[accfoll2],results[accfoll3],results[accfoll4],results[time])
points = zip(results[accfoll1],results[accfoll2],results[accfoll3],results[accfoll4])

def powerConsumption(T):
  #pCons = T[4]*(sum(x for x in T if x > 0)-T[4])
  pCons = sum(x for x in T if x > 0)
  #print("Power - Res: ", pCons)
  return pCons

'''
finalMap = set(map(powerConsumption,points))
print("Final map: ", finalMap )
print("Max: ", max(finalMap) )
print("Sum: ", sum(finalMap) )
#print("Median: ", statistics.median(finalMap) )
writeObjectiveToOutfile(objectiveName, sum( finalMap ) )
#writeObjectiveToOutfile(objectiveName, max( finalMap ) )
#writeObjectiveToOutfile(objectiveName, statistics.median(finalMap) )
'''

#writeObjectiveToOutfile(objectiveName, max(map(powerConsumption,points)))
writeObjectiveToOutfile(objectiveName, sum(map(powerConsumption,points)))
