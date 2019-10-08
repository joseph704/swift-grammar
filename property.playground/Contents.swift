// Stored Property(저장 프로퍼티)

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6 // 만약 var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3) 에서 var를 let 으로 바꾼다면 rangeOfThreeItems.firstValue = 6 도 에러 발생!
// error -> rangeOfThreeItems.length = 3

// Lazy Stored Properties(게으른 저장 프로퍼티)
// - 값이 사용되기 전까지는 값이 계산되지 않는 프로퍼티

// Lazy Stored Properties 예제

class DataImporter {
    //DataImporter클래스는 외부파일에서 데이터를 가져오는 클래스!
    var filename = "data.txt"
    //데이터를 가져올 외부파일이름은 "data.txt"인가봐요 :)
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    //DataManager클래스는 데이터 관리하는 클래스에요. importer가 위에서 선언한 DataImporter의 인스턴스이며, lazy로 선언되었네요.
}

let manager = DataManager()//DataManager의 인스턴스를 만듭니다. 참고로, DataManager의 저장프로퍼티들은 초기값이 있으므로 init이 없어도 됩니다.
manager.data.append("Some data")//DataManager의 저장프로퍼티 data라는 배열에 어떤 데이터를 집어넣고,
manager.data.append("Some more data")//또 집어넣어요.

//하지만 아직까지 DataImporter의 인스턴스인 importer프로퍼티는 생성되지 않았습니다. lazy 저장프로퍼티이기 때문이죠.


// Computed Property(연산 프로퍼티)
// 연산프로퍼티는 값을 "저장"하기 보다는 그때그때 특정한 연산을 통해 값을 리턴함

class Point2 {
    
    var tempX : Int = 1   // 저장소 역할을 하는 tempX
    
    var x: Int {                     // 연산 프로퍼티
        get {                        // getter 부분
            return tempX
        }
        set(newValue) {              // setter 부분
            tempX = newValue * 2
        }
    }
}

var p: Point2 = Point2()
p.x = 12                       // Point 안에있는 연산 프로퍼티의 newValue가 12가 된다.

print(p.tempX)

class Joseph {
    var tempX :Int = 0
    var x:Int {
        get{
            return tempX
        }
        set {                           // set()에서 소괄호를 생략하려면 꼭 newValue를 써야한다
            tempX = newValue * 2
        }
    }
}

var p2: Joseph = Joseph()
p2.x = 13
print(p2.x)

// Apple 예제
struct Point {
    var x = 0.0, y = 0.0 //이렇게 한 줄에 "저장 프로퍼티"를 선언했네요 :)
}

struct Size {
    var width = 0.0, height = 0.0//역시나 입니다.
}

struct Rect {
    
    //저번에 배운 CGRect와 비슷하다고 생각하시면 됩니다!!
    var origin = Point()//origin은 x,y좌표니 Point()타입으로 만들어주고
    
    var size = Size()//size는 너비와 높이를 가지니 Size()타입으로 만들어줍니다.
    
    var center: Point {
        
        //center라 함은 어떤 사각형의 가운데인 "좌표"겠죠? 그러니 Point타입으로 선언해주고!! get과 set이 나오는 것을 보니 center는 "연산 프로퍼티"임을 알 수 있네요.
        
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            //get에도 위처럼 새로 변수를 선언하고 값을 할당 할 수 있어요. 리턴만 제대로 해주면 된답니다.
            //리턴하는 타입은 center의 타입과 반드시 같아야해요. 즉 Point 타입.
            
            return Point(x: centerX, y: centerY)
            
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

print(initialSquareCenter)//(x: 5.0,y: 5.0)

square.center = Point(x: 15.0, y: 15.0)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// Prints "square.origin is now at (10.0, 10.0)"

class StepCounter {                         // totalSteps을 위한 willSet과 didSet 감시자는 새로운 값이 할당될 때 마다 호출 되며, 새로운 값이 현재 값과 같다고 하더라도 호출이 됨.
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {            // StepCounter 클래스는 Int 타입의 totalSteps 속성으로 선언되며 willSet과 didSet 감시자를 가지는 저장 속성임.
            print("About to set totalSteps to \(newTotalSteps)") // willSet 감시자 예제는 newTotalSteps 이름인 사용자 인자를 가짐. 이 예제는 값이 설정되면 단순히 그 값을 출력함.
        }
                                                                 // didSet 감시자는 totalSteps 값이 갱신된 후에 호출되며, totalSteps의 새로운 값을 이전 값과 비교함. 만약 총 발걸음 수가 증가하면 얼마나 많이 걸었는지 출력함. didSet 감시자는 이전값에 사용자 인자 이름을 지원하지 않고, 대신 oldValue 기본 이름으로 사용함.
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps



// 타입 프로퍼티
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
