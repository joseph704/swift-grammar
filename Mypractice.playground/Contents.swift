func factorial(num: Int) -> Int {
    if num==1 {
        return 1
        
    }
    else{
        return num * factorial(num: num-1)}
}

factorial(num: 4)

var numbers = [1, 4, 2, 5, 8, 3]

numbers.sort(by: { x, y in
    return x < y
})

var oneParameterAndReturnValue: (Int) -> (Int) = { x in
    return x % 10
}

oneParameterAndReturnValue(97)

var asdf: (String) -> (String) = { x -> String in return x}
asdf("sadf")

func swapTwoInts( a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}



var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var sdf: (String) -> ()

var joseph: (String) -> (String) = {x -> String in return x}

joseph("joseph")

var eee:String="eee"
var ddd:Int=10
func generics<T>(a: inout T) -> (T) {
    return a
}

generics(a: &eee)
generics(a: &ddd)


var a = 10
var b = 20

func swap(first a:inout Int,second b:inout Int)->Void {
    let temp = a
    a=b
    b=temp
}
swap(&a,&b)
print(a,b)
