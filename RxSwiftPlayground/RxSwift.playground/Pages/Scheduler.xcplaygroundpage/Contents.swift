//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift


PlaygroundPage.current.needsIndefiniteExecution = true
var str = "Hello, playground"

//: [Next](@next)

Thread.isMainThread
let disposeBag = DisposeBag()

let scheduler = SerialDispatchQueueScheduler(qos: DispatchQoS.background)

let observable1 = Observable<Void>.create { observer -> Disposable in

    observer.onNext(())
    print("observable1 isMainThread? \(Thread.isMainThread)")
    return Disposables.create()
}.subscribeOn(scheduler)

let observable2 = Observable<Void>.create { observer -> Disposable in

    observer.onNext(())
    print("observable2 isMainThread? \(Thread.isMainThread)")
    return Disposables.create()
}.subscribeOn(MainScheduler.instance)

let observable3 = Observable<Void>.create { observer -> Disposable in

    observer.onNext(())
    print("isMainThread? \(Thread.isMainThread)")
    return Disposables.create()
}

observable1
    .flatMap({observable2})
    .subscribe()
    .disposed(by: disposeBag)
