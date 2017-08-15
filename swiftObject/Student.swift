//
//  Student.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/3.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class Student: NSObject {
    var name: String?
    var age : Int?
    var score : NSNumber?
    
    
    init(name: String, age: Int, score: NSNumber) {
        self.name = name
        self.age = age
        self.score = score
    }

}
