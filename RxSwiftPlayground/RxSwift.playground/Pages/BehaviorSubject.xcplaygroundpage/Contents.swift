//: [Previous](@previous)

import Foundation
import UIKit
import RxSwift

var str = "Hello, playground"
print(str)
let disposeBag = DisposeBag()

/// MARK: - --------------------------- BehaviorSubject
// 直前のonNextの値を保持し、subscribeした時点で最後の値を返す

let behavior = BehaviorSubject<Int>(value: 0)
behavior.onNext(5)
behavior.subscribe(onNext: {
    print($0)
})
    .addDisposableTo(disposeBag)
