//
//  BaseNavigationViewController.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/4.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self as? UINavigationControllerDelegate;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func  navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        for tab :UIView in (self.tabBarController?.tabBar.subviews)! {
            if tab.isKind(of: NSClassFromString(
            "UITabBarButton")!) {
                tab.removeFromSuperview()
            }
        }
    
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
