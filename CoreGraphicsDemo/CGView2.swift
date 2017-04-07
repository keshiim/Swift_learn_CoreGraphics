//
//  CGView2.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/1.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView2: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        //1 获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        //2 绘制路径
        context?.move(to: CGPoint.init(x: 10, y: 30))
        context?.addLine(to: CGPoint.init(x: 10, y: 100))
        context?.addLine(to: CGPoint.init(x: 150, y: 100))
        
        //封闭路径
        context?.closePath()
        
        //3 设置上下文属性
        UIColor.red.setStroke()
        UIColor.yellow.setFill()
        
        //4 绘制路径
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
    }

}
