//
//  ViewController.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/2.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        let name :String = "你好"
        let label  = UILabel(frame:CGRect(x:100,y:100,width:50,height:50))
        label.text = name
        label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
       self.view.addSubview(label)
       self.setsubView()
        
        let dic :Dictionary = ["username": "bdrugs",
                               "password": "888888"]
        SwiftHttpNetwork.POST(URLString: userLogin , parameters: dic, completion: { (task) in
            let  account = Account()
            account.mj_setKeyValues(task)
            print("+++++++",account.access_token ?? String())
            
        }) { (error) in
            print("--------",error)
        }
        
//        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
//            print("min is \(bounds.min) and max is \(bounds.max)")
//        }
        
//        print(greet(person: "Bill", from: "Cupertino"))
        //调用可变参数函数
       print(arithmeticMean(1,2,3,4,5))
        
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
        //尾随闭包语法 
        let numbers = [16, 58, 510]
        print(numStr(numbers, _digitNames:digitNames))
        
     
    
    }
    
    
    
    func setsubView() {
        print("我要布子视图")
        let titleLabel  = UILabel()
        self.view.addSubview(titleLabel)
        titleLabel.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(20)
            make.top.equalTo()(200)
            make.width.equalTo()(100)
            make.height.equalTo()(20)
            
        }
        titleLabel.backgroundColor = UIColor.black
        titleLabel.text = "代码布局"
        titleLabel.textColor = UIColor.white
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var pushAction: UIButton!

    @IBAction func push(_ sender: Any) {
        
        let vc = FirstTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 函数类型
    func addTwoInts(_ a: Int, _ b :Int) -> Int {
        return a + b
    }
   //可选数组返回类型
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
//多重返回值函数
//    func minMax(array:[Int]) -> (min: Int, max: Int) {
//        var currentMin = array[0]
//        var currentMax = array[0]
//        for value in array[1..<array.count] {
//            if value < currentMin {
//                currentMin = value
//            }else if value > currentMax {
//            currentMax = value
//            }
//        }
//        return (currentMin, currentMax)
//        
//    }
    
    // 指定参数标签
    func greet(person: String, from hometown: String) -> String {
        
        return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    
   // 可变参数
    func arithmeticMean(_ numbers:Double...) -> Double {
        var total :Double = 0
        for number in numbers {
         total += number
        }
        return total/Double(numbers.count)
    }
    
    //函数类型作为参数类型 (Int, Int) -> Int
    
    //函数类型作为返回类型 (Int) -> Int
    
    
    // 闭包
    
    //1.3 尾随闭包
    
    func numStr(_ numbers:[Int], _digitNames:[Int:String]) -> ([String]) {
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = _digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        return strings
    }
    
    

}

