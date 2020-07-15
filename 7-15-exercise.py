def processLine(line, wordCounts):
    line = replacePunctuations(line)
    words = line.split()
    for word in words:
        if word in wordCounts:
            wordCounts[word] += 1
        else:
            wordCounts[word] =  1
            
def replacePunctuations(line):
    for ch in line:
        if ch in "~@#$%^&*()_-+=~<>?/,.;:!{}[]|'\"":
            line = line.replace(ch, " ")
    return line

song = open("song.txt", "r")
wordCounts = {}
for line in song:
    processLine(line.lower(), wordCounts)
song.close()
    
myList = list(wordCounts.items())
listReversed = [[x,y] for (y,x) in myList]
listReversed.sort()
for item in listReversed:
    print(str(item[0]) + " " + str(item[1]))

