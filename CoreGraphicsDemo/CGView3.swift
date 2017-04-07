//
//  CGView3.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/1.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView3: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        self.drawRectWithContext(context: context!)
        self.drawRectByUIKitWithContext(context: context!)
    }

    /// Context直接回执
    ///
    /// - Parameter context:
    public func drawRectWithContext(context: CGContext) {
        let rect = CGRect.init(x: 20, y: 0, width: 280, height: 50)
        context.addRect(rect)
        UIColor.blue.set()
        context.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
    
    /// UIKit API调用绘制
    ///
    /// - Parameter context:
    public func drawRectByUIKitWithContext(context: CGContext) {
        let rect = CGRect.init(x: 20.0, y: 60.0, width: 280.0, height: 50.0)
        let rect2 = CGRect.init(x: 20.0, y: 120.0, width: 280.0, height: 50.0)
        
        UIColor.yellow.set()
        UIRectFill(rect)
        
        UIColor.red.setFill()
        UIRectFill(rect2)
        
    }
}
