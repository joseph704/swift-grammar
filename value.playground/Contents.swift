var message="Hello~"

var isLogin=false

var day=27

var weight=65.5

Int.max

struct Point{
    var x=0.0,y=0.0
    
}

struct Size {
    var height=0.0,width=0.0
}

// 저장프로퍼티 (stored property)
struct rect{
    var origin = Point()
    var size = Size()
    
    var tempX = Point(x: 0.0, y: 0.0)
    var center:Point {
        
        mutating get {
            tempX.x=origin.x + (size.width/2)
            tempX.y=origin.y + (size.height/2)
            return tempX
        }
        set (newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

