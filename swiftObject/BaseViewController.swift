//
//  BaseViewController.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/4.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tagLog : Int? //全局变量
    var keepBool :Bool?
    //懒加载
    lazy var dataSource : NSMutableArray = {
       var  dataSourceArr = NSMutableArray()
        return dataSourceArr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func pushTo(_vc: UIViewController) {
        self.navigationController?.pushViewController(_vc, animated: true)
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
