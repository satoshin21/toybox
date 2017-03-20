//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.backgroundColor = .white

let childView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
view.addSubview(childView)
childView.backgroundColor = .gray

childView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
childView.center = view.center
let animation = CABasicAnimation(keyPath: "transform.rotation.y")
animation.fromValue = 0
animation.toValue = 4
animation.duration = 2

childView.layer.setValue(4, forKeyPath: "transform.rotation.y")
childView.layer.add(animation, forKey: nil)


PlaygroundPage.current.liveView = view
