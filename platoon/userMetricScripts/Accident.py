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
  print (key,val)
  if os.path.isfile(objectivesFile):
    json_data = open(objectivesFile)
    parsed_json = json.load(json_data)

    parsed_json[key] = val

    dataString = json.dumps(parsed_json, sort_keys=True,indent=4, separators=(',', ': '))

    with io.open(objectivesFile, 'w', encoding='utf-8') as f:
      f.write(str(dataString))

def loadCSV(f):
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
scenarioDataFolder = sys.argv[3]


car1 = sys.argv[4]
car2 = sys.argv[5]

results = loadCSV(resultsFile)

car1Position = results[car1]
car2Position = results[car2]
distance = list()
for item1, item2 in zip(car1Position,car2Position):
  distance.append(item1-item2)
  
accident = 0
for item in distance:
	if item <= 0:
		accident = 1
writeObjectiveToOutfile(objectiveName, accident)
