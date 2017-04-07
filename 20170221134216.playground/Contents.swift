//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Foo {
    func hogehoge(string: String) {
        
        print("Foo - hogehoge\(string)")
    }
}

class Bar: Foo {
    
    override func hogehoge(string: String?) {
        
        print("Foo - hogehoge\(string)")
    }
    
}

let s = Bar()
let string: String? = "hogehoge"
s.hogehoge(string: string)
s.hogehoge(string: "\(string)")