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
    
 

}

