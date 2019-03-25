//
//  ViewController.swift
//  What is ARC
//
//  Created by Alon Harari on 25/03/2019.
//  Copyright © 2019 Alon Harari. All rights reserved.
//


// ARC = Automatic Reference Counting - this is Apple's way of handling memory managment of objects for you. for each object it is keeping count of how many strong references are poiniting for that object.

//Example:
//to remove a reference poinitng to an object all we need to do is to set it to nil and the closure deinit will be called.
//it will be called only if the refernce is weak!!!
//but if it is a strong reference - deinit wont be called... try and ARC Count will not count down by 1
import UIKit
import Foundation

class ViewController: UIViewController {
    
    var alon: Person?
    var mazda: Car?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObjects()
        print("ARC count \(CFGetRetainCount(self))")
        assignProperties()
    }
    func createObjects() {
        alon = Person(name: "Alon Harari", car: nil) // var alon has a strong refrence to object Person
        mazda = Car(name: "Mazda 3", owner: nil) // var mazda has a strong refrence to object Car
        
        //alon = nil  // Retain Count would decrease by 1
        //mazda = nil  // Retain Count would decrease by 1
    }
    func assignProperties() {
        alon?.car = mazda
        mazda?.owner = alon
        
        alon = nil // Retain Count would decrease by 1

    }
    
    
}
class Person {
    let name: String
    var car: Car?
    
    init(name: String, car: Car?){
        self.name = name
        self.car = car
        print("\(self.name) is being initialized")

    }
    deinit {
        print("\(name) is being deinitialized")
    }
}


class Car {
    let name: String
    weak  var owner: Person?
    
    init(name:String, owner: Person?){
        self.name = name
        self.owner = owner
        print("\(self.name) is being initialized")

    }
    deinit {
        print("Car of owner:\(name) is being deinitialized")
    }
}

