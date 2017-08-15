//
//  FirstTableViewCell.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/4.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    var model :Student = Student(name: "", age: 1, score: 123)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
