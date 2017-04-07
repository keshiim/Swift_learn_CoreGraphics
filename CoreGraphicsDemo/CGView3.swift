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
    }

    public func drawRectWithContext(context: CGContext) {
        let rect = CGRect.init(x: 20, y: 0, width: 280, height: 50)
        context.addRect(rect)
        UIColor.blue.set()
        context.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
}
