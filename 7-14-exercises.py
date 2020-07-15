#8.4
print("8.4")

def count(s, ch):
    count = 0 
    for c in s:
        if c == ch:
            count += 1
    return count

print(count("Hello, world", 'o'))


#10.1
print("10.1")
def inputInts():
    s = input("Enter a list of numbers ")
    return [int(i) for i in s.split()]

def assignGrade(score, best):
    letterGrade = 'F'
    if score >= best - 10:
        letterGrade = 'A'
    elif score >= best - 20:
        letterGrade = 'B'
    elif score >= best - 30:
        letterGrade = 'C'
    elif score >= best - 40:
        letterGrade = 'D'
    return letterGrade

def assignGrades(l):
    for i in range(len(l)):
        print("Student " + str(i) + " score is " + str(l[i]) +  " and has a grade of " + assignGrade(l[i], max(l)))
    
inputList = inputInts()
assignGrades(inputList)



#10.3
print("10.3")
def contains(i, l):
    for item in l:
        if item == i:
            return True
    return False

def countInts(countNum, l):
    count = 0
    for n in l:
        if n == countNum:
            count += 1
    return count
    
#reusing string input function from 10.1
inList = inputInts()
distinctNumbers = []

for n in inList:
    if not contains(n, distinctNumbers):
        distinctNumbers += [n]

occurences = [countInts(i, inList) for i in distinctNumbers]

for i in range(len(distinctNumbers)):
    print(str(distinctNumbers[i]) + " occurs " + str(occurences[i]) + " times.")

#10.5
numbers = inputInts()
distinctNumbers = []
for n in numbers:
   if not contains(n, distinctNumbers):
        distinctNumbers += [n]

print(distinctNumbers)

#10.9
print("10.9")
def mean(x):
    return sum(x) / len(x)

def deviation(x):
    diffs =[((i - mean(x)) ** 2) for i in x]
    return (sum(diffs) / len(x)) ** (1/2)
l = [1,2,3,4,5]
print(mean(l))
print(deviation(l))

#checking solution with numpy
import numpy as np
print(np.mean(l))
print(np.std(l))


#11.1
print("11.1")
def sumColumn(m, columnIndex):
    total = 0
    for row in m:
        total += row[columnIndex]
    return total
m = [
    [1,3,4,5],
    [6,7,8,9,0],
    [5,4,4,4,4],
    [6,7,8,9,10]
]
print(str(sumColumn(m, 0)))


#11.2
print("11.2")
def sumMajorDiagonal(m):
    total = 0
    for i in range(len(m)):
        total += m[i][i]
    return total
m = [
    [1,3,4,5,5],
    [6,1,8,9,0],
    [5,4,1,4,4],
    [6,7,8,1,10],
    [6,7,8,9,1]
]
print(sumMajorDiagonal(m))

#11.4
print("11.4")
def showTotalHours(l):
    for i in range(len(l)):
        print("Employee " + str(i) + " hours worked: ", end="")
        print(sum(l[i]))

employeeHours = [
    [2,4,3,4,5,8,8],
    [7,3,4,3,3,4,4],
    [3,3,4,3,3,2,2],
    [9,3,4,7,3,4,1]
]
showTotalHours(employeeHours)

    
