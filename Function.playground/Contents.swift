func hello(name:String)-> String {
    let message="Hello~ " + name
    return message
}

hello(name: "차요셉")




func yoseph(hobby:String)->String {
    let message=hobby + "는 요셉이 취미"
    return message
}

yoseph(hobby: "Soccer")

func addTwoNumbers(num1:Int, num2: Int = 100) -> Int {
    let sum = num1 + num2
    return sum
}

addTwoNumbers(num1: 5, num2: 10)

addTwoNumbers(num1:5)


func addNumbers(numbers: Int...) -> Int {
    var sum=0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1,2,3,4,5)

func myInfo() -> (name: String, weight: Int) {
    return ("완택",65)
}


myInfo().name
myInfo().weight

let info = myInfo()
print(info)
// <-> 딕셔너리 : var toDoDic2: Dictionary<String, String>=["18":"십팔"]

var Array:Array<String> = ["asdf","asdfd"]

var dictionary:Dictionary<String, String>=["3":"4"]
var twople=["asd","asdf"]

var array:Array<String>=["123123","123123"]

print(124)

print(123123,"sdfsdf")
print(123,"hello",true,123.345,separator:"---",terminator: "")


var sum=0

func addnum(number: Int...)->Int{
    for i in number
    {
        sum += i
    }
    return sum
}

addnum(number: 1,2,3,4,5)

func calculate(num1: Int, num2: Int)-> Int {
    return num1 * num2
}


func calculate(devideFirstNumber num1: Int, bySecondNumber num2: Int)-> Int {
    return num1 / num2
}
calculate(devideFirstNumber: 10, bySecondNumber: 10)
calculate(num1: 10, num2: 10)

func addTwoNumber(num1: Int, num2: inout Int) -> Int {
    num2=7
    return num1 + num2
}

var test1=1
var test2=2

addTwoNumber(num1: test1, num2: &test2)
print(test2)

