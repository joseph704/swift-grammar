/*
 CLASS
 - 단일 상속 가능
 - 참조타입(call by reference) (인스턴스 생성시 let 사용)
 - ios 프레임워크의 대부분이 클래스로 구성되어있다
 
 STRUCT
 - 상속이 불가능
 - 값타입 (인스턴스 생성시 let,var 차이점 존재)
 - swift의 대부분은 모두 struct
 
 CLASS 와 STRUCT의 공통점
 1 . 서로 다른 타입(자료형)들을 하나로 묶을 수 있다.
 2. 이러한 묶은 자료형들을 새로운 타입처럼 사용 가능.
 3. 클래스/구조체 안에서 메소드/프로퍼티 정의 가능
 4. extension이 가능.
 
 */



class Circle {
    public var radius: Double         // property
    public let pi=3.1415926535
    
    init() {
        radius=10.0
    }
    
    init(radius:Double) {
        self.radius=radius
    }
    
    func area() -> Double {           //method
        return radius*radius*pi
    }
}

let circle=Circle.init(radius: 12)
circle.area()
circle.pi
class NoteBook {
   private var name = ""
    
    func setName(name: String) {
        self.name=name
    }
    func turnOn() {
        print("booting...")
    }
}

class MacBook: NoteBook {
    var hasTouchBar = true
    var macOSVersion = "10.13"
    
    func turnOnTouchBar() {
        
    }
}

let macBook = MacBook()
macBook.setName(name: "MacBook Pro")
macBook.turnOn()



class NoteBook1 {
    var name = ""
    func turnOn() {
        print("Booting1...")
    }
}

class MacBook1:NoteBook1 {
    var hasTouchBar1=true
    var macOSVersion1 = "10.13"
    
    override func turnOn() {
        super.turnOn()
        print("\(name)'s current madcOSVersion is \(macOSVersion1)")
    }
    func turnOnTouchBar() {
        
    }
}

let macBook1:MacBook1 = MacBook1()
macBook1.name = "MacBook Pro1"
macBook1.turnOn()

// 소멸자

class Circle1 {
    var radius = 0
    init() {
        print("Initializer called")
    }
    
    deinit {
        print("Deinitializer called")
    }
}

var circle1 = Circle1()

if true {
    var circle1 = Circle1()
}

struct Cir {    // struct 를 class로 바꿔보시오
    var radius = 0
}

var cir1:Cir = Cir()

var cir2 = cir1
cir2.radius=10

print(cir2.radius)
print(cir1.radius)

// 열거형
enum AppleOs {
    case iOS
    case macOS
    case tvOS
    case watchOS
}

var osType:AppleOs = AppleOs.macOS

func printAppleDevice(osType1: AppleOs) {
    switch osType1 {
    case .iOS:
        print("iPhone")
    case .macOS:
        print("iMac")
    case .tvOS:
        print("Apple TV")
    case .watchOS:
        print("Apple watch")
}
}

printAppleDevice(osType1: AppleOs.watchOS)


//--------------------------------------->


enum AppleOs1: String{
    case iOS = "iPad"
    case macOS
    case tvOS
    case watchOS = "Apple watch"
}
var osType2: AppleOs1 = AppleOs1.iOS
print(osType2.rawValue) // 원시값 출력

let macOs2: AppleOs1 = AppleOs1.macOS
print(macOs2) // 이것도 원시값 출력

