//
//  SecondViewController.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/4.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
     self.tagLog = 111
    }
    
    override func viewWillAppear(_ animated: Bool) {
       self.view.backgroundColor = UIColor.red
      print(sumOf(numbers: 42,577,57))
        
        let increment = makeIncrementer()
        print(increment(7))
        
        let hearts = Suit.Hearts
        let heartsDescription = hearts.simpleDescription()
        print(heartsDescription)
        
//        self.makeNon()
     print( self.makeString())
    }
    
    func sumOf(numbers:Int...) -> Int {
        var  sum = 0
        for number in numbers {
            sum += number
        }
       return sum
    }
    
    
    
    
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
   
    enum Suit {
        case Spades, Hearts, Diamonds, Clubs
        func simpleDescription() -> String {
            switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
            }
        } }
   
    func makeNon() -> Void {
        let defaultColorName = "green"
        let userDefinedColorName : String? = nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
//        self.view.backgroundColor = UIColor.green
        
        
    }
    
    func  makeString () -> String {
        // 字符串拼接
//        var  someString = "some string literal value"
//        someString += "and  carriage"
        
        // 字符串插值
        let  multiplier = 3
        let  message = "\(multiplier) time 2.5 is \(Double(multiplier)*2.5)"
        print("has \(message.characters.count)")
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
        
        return message
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //页面跳转
    @IBAction func push(_ sender: UIButton) {
//       UIApplication.shared.open(URL.sr, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
//        let thirdVC  = thirdViewController()
//        self.pushTo(_vc: thirdVC)
//        switch self.tagLog! {
//        case 121:
//            print("属性测试")
//        case 111:
//            print("这是什么属性")
//        default:
//            break
//        }
//         let john = Person()
//        //可以将一个 Residence 的实例赋给 john.residence ，这样它就不再是 nil 了:
//        john.residence = Residence()
//        if let roomCount = john.residence?.numberOfRooms {
//            print("John's residence has \(roomCount) room(s).")
//        } else {
//            print("Unable to retrieve the number of rooms.")
//        }
        
    }
    
    //使用可选链式调用代替强制展开
    class Person {
        var residence: Residence?
    }
    class Residence {
        var numberOfRooms = 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
