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
        
        let context: CGContext! = UIGraphicsGetCurrentContext()
        self.drawRectWithContext(context: context)
        self.drawRectByUIKitWithContext(context: context)
        self.drawEllipse(context: context)
        self.drawArc(context: context)
        self.drawCure(context: context)
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
    
    
    /// 绘制椭圆
    ///
    /// - Parameter context:
    public func drawEllipse(context: CGContext) {
        let rect = CGRect.init(x: 20, y: 180, width: 100, height: 120)
        
        context.addEllipse(in: rect)
        UIColor.purple.set()
        context.drawPath(using: CGPathDrawingMode.fill)
    }
    
    /// 绘制弧形
    ///
    /// - Parameter context:
    public func drawArc(context: CGContext) {
        context.addArc(center: CGPoint.init(x: 200, y: 250), radius: 50, startAngle: 0, endAngle: .pi, clockwise: true)
        UIColor.green.set()
        context.drawPath(using: CGPathDrawingMode.fill)
    }
    
    /// 绘制贝塞尔曲线
    ///
    /// - Parameter context: <#context description#>
    func drawCure(context: CGContext) -> Void {
       //绘制曲线
        context.move(to: .init(x: 20, y: 310))
        //绘制二次贝塞尔曲线
        context.addQuadCurve(to: .init(x: 100, y: 400), control: .init(x: 220, y: 310))
        
        context.move(to: .init(x: 230, y: 310))
        //绘制三次贝塞尔曲线
        context.addCurve(to: .init(x: 300, y: 500), control1: .init(x: 100, y: 330), control2: .init(x: 400, y: 410))
        //
        UIColor.yellow.setFill()
        UIColor.red.setStroke()
        context.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    
}
