// Optional Chaining 옵셔널 체이닝
class Person {
    // Residence 형태다
    var residence: Residence?
    
}

class Residence {
    var numberOfRooms = 1
}

let joseph = Person()
joseph.residence =  Residence()
print(joseph.residence!.numberOfRooms)
