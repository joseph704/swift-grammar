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

