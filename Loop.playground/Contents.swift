for i in 1...10 {
    print(i)
}

for i in stride(from:1,to:10, by: 2) {
    print(i)
}

for i in stride(from:10,to:1, by: -2) {
    print(i)
}

for i in 1...9 {
    for j in 2...9 {
        print(j*i)
    }
}

for j in 2...9 {
    for i in 1...9 {
//        print(String(j)+"X"+String(j)+"="+String(i*j))
        print("\(j) X \(i) = \(i*j)")
    }
}
var a:Array<Int> = [1,2,3,4]
var b = a.count
print(b)
for i in 0...a.count-1 {
    print(a[i])
}

var i=0
while i<10 {
    i+=1
    print(i)
}

i=0
repeat{
    i+=1
    print(i)
} while i<10




for i in 10...0
{
    print(i)
}
