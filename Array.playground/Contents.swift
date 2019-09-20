var toDoArray: [String]=["Travel","Work","Call"]
//var toDoArray: Array<String>=["Travel","Work","Call"]
var evenNumber: [Int]=[2,4,6,8]


evenNumber.append(10)
evenNumber.insert(12, at: 0)

evenNumber.remove(at: 0)
print(evenNumber)

for toDo in toDoArray {
    print(toDo)
}
