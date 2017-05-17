//: Playground - noun: a place where people can play

import UIKit

let count = 1000

/*
 > []
 > [][]
 > [][][]
 > [][][][]
 > [][][][][]
 
 */

do {
    var a = [Int]()
    for i in 0..<count {
        a.append(i)
    }
}

/*
 [ , , , , , , , , , , , , , ]
 */

do {
    var a = [Int].init(repeating: 0, count: count)
    for i in 0..<count {
        a[i] = i
    }
}