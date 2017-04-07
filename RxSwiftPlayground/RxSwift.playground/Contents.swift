//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"

let array = Array((0...100))
let disposeBag = DisposeBag()

/// MARK: - --------------------------- AsyncSubject
// Androidのみ。completeしたタイミングで最後のnextの値がSubscriberに渡される。

/// MARK: - --------------------------- BehaviorSubject
// 直前のonNextの値を保持し、subscribeした時点で最後の値を返す

let behavior = BehaviorSubject<Int>(value: 0)
behavior.onNext(5)
behavior.subscribe(onNext: {
    print($0)
}).addDisposableTo(disposeBag)

// MARK: - --------------------------- ReplaySubject
// 指定した数または全てをキャッシュ (.createUnbounded()) する

let replaySubject = ReplaySubject<Int>.create(bufferSize: 2)
replaySubject.onNext(1)
replaySubject.onNext(2)
replaySubject.onNext(3)
replaySubject.subscribe(onNext: {
    print("replay \($0)")
})

// MARK: - --------------------------- Variable
// Observableではない。onError, onCompletedが発生しない。内部にBehaviorSubjectをラップしている
// BindToで接続可能

let variable = Variable(0)
variable.value = 1
variable.asObservable().subscribe(onNext: {
    
    print("variable \($0)")
}).addDisposableTo(disposeBag)
variable.value = 2

let boolVariable = Variable(false)

let uiswitch = UISwitch()
uiswitch.rx.isHidden

boolVariable.asObservable().bindTo(uiswitch.rx.isHidden)


// MARK: - --------------------------- concatとmerge
// concatは与えられた順に合成、mergeはストリームの順を考慮して合成
var observable1 = Observable.from((0...10))
var observable2 = Observable.from((11...20))

Observable.of(observable1, observable2)
    .concat()
    .subscribe(onNext: {
        print("concat \($0)")
    }).addDisposableTo(disposeBag)

Observable.of(observable1, observable2)
    .merge()
    .subscribe(onNext: {
        print("merge \($0)")
    }).addDisposableTo(disposeBag)