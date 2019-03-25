//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




////////////////////////////////////////////////////////////////////////////////////////////////
// REFERENCE COUNT
////////////////////////////////////////////////////////////////////////////////////////////////

 class Employee {
    let empName: String
    init(employeeName empName: String) {
        self.empName = empName
        print("\(empName) is being initialized")
    }
    
    deinit {
        print("\(empName) is being deinitialized")
    }
}
var emp1: Employee?
var emp2: Employee?
var emp3: Employee?
emp1 =  Employee(employeeName: "John Appleseed")
emp2 = emp1
emp3 = emp1
emp1 = nil // Retain Count would decrease by 1
emp2 = nil // Retain Count would decrease by 1
emp3 = nil // Retain Count would decrease by 1



////////////////////////////////////////////////////////////////////////////////////////////////
// WEAK REFERENCE
////////////////////////////////////////////////////////////////////////////////////////////////
/*
class Employee {
    let empName: String
    var dept: Department?
    
    init(employeeName empName: String) {
        self.empName = empName
        print("\(empName) is being initialized")
    }
    
    deinit {
        print("\(empName) is being deinitialized")
    }
}
class Department {
    let deptName: String
    weak var emp: Employee?

    init(departmentName deptName: String) {
        self.deptName = deptName
        print("\(deptName) is being initialized")
    }
    
    deinit {
        print("\(deptName) is being deinitialized")
    }
}

var john: Employee? = Employee(employeeName: "john")
var iOS: Department? = Department(departmentName: "iOS")

john!.dept = iOS
iOS!.emp = john

john = nil
iOS = nil

*/

////////////////////////////////////////////////////////////////////////////////////////////////
// UNOWNED REFERENCE
////////////////////////////////////////////////////////////////////////////////////////////////
class Owner {
    let ownerName: String
    var vehicle: Vehicle?
    
    init(ownerName name: String) {
        self.ownerName = name
        print("\(ownerName) is being initialized")
    }
    deinit {
        print("\(ownerName) is being deinitialized")
    }
}
class Vehicle {
    let vehicleNumber: String
    unowned let owner: Owner
    init(vehicleNumber number: String, owner: Owner) {
        self.vehicleNumber = number
        self.owner = owner
        print("\(vehicleNumber) is being initialized")
    }
    deinit {
        print("\(vehicleNumber) is being deinitialized")
    }
}

var appleseed: Owner?
appleseed = Owner(ownerName: "John Appleseed")
appleseed?.vehicle = Vehicle(vehicleNumber: "TE 12 MP 5678", owner: appleseed!)
appleseed = nil



////////////////////////////////////////////////////////////////////////////////////////////////
// UNOWNED REFERENCE
////////////////////////////////////////////////////////////////////////////////////////////////
