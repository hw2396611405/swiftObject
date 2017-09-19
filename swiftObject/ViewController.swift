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
        
        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        
        print(greet(person: "Bill", from: "Cupertino"))
    
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
        
//        let vc = FirstTableViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
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

}

