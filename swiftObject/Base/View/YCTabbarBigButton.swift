//
//  YCTabbarBigButton.swift
//  swiftObject
//
//  Created by yicheng on 2017/7/13.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

class YCTabbarBigButton: UIButton {
    // 屏蔽按钮高亮效果
    override var isHighlighted: Bool{
        get{
            return false
        }
        set{
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 设置视图
    private func setupUI(){
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        setTitleColor(UIColor.darkGray, for: UIControlState.normal)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width)
        // 设置title
        
        titleLabel?.frame = CGRect(x: 0, y: self.frame.width, width: self.frame.width, height: self.frame.height - self.frame.width)
    }

}
