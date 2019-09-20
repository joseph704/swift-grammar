var toDoDic1=[17: "Play", 25: "Watch Movies", 28: "Travel"]

var toDoDic2: Dictionary<String, String>=["17":"Play","25": "Watch Movies", "28": "Travel"]
var toDoDic = ["17":"Play","25": "Watch Movies", "28": "Travel"]

toDoDic["31"]="Study"
print(toDoDic)

toDoDic.removeValue(forKey: "31")
print(toDoDic)

toDoDic["28"]=nil
print(toDoDic)

for(key, value) in toDoDic {
    print("key: \(key), value: \(value)")
}

for key in toDoDic.keys {
    print(key)
}

toDoDic.removeAll()


var joseph:Dictionary<Int,String> = [1:"김민제",2:"김시영",3:"장현아",4:"차요셉"]



