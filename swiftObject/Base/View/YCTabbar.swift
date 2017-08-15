//
//  YCTabbar.swift
//  swiftObject
//
//  Created by yicheng on 2017/7/13.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class YCTabbar: UIView {
      // 定义一个闭包类型
  typealias funcBlockA = (Int,Int) -> String
     var blockPropertyA : funcBlockA?
    
    typealias  swiftB = (String)->Void
    var swiftBlock : swiftB?
    
    
    func testBlockA(blockfunc:funcBlockA!)
    {
        
//        if let exsistblock = blockfunc
//        {
//            let retstr = blockfunc(5,6)
//            print(retstr)
//        }
    }
    
    

}
