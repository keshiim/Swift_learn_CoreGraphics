//
//  CGView4.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/7.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView4: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context: CGContext! = UIGraphicsGetCurrentContext()
        self.drawText(context: context)
        
    }
    
    public func drawText(context: CGContext) -> Void {
        let str = "使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制使用CoreGraphics进行文字绘制"
        let rect = CGRect.init(x: 20, y: 20, width: 280, height: 200)
        let font = UIFont.systemFont(ofSize: 16)
        let color = UIColor.red
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.left
        
        (str as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: font,
                                                          NSForegroundColorAttributeName: color,
                                                          NSParagraphStyleAttributeName: style])
    }

}
