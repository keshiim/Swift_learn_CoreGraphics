//
//  CGView.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/1.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit
import CoreGraphics

/// CG绘制图层
/* 一般步骤
1、获取绘图上下文
2、创建并设置路径
3、将路径添加到上下文
4、设置上下文状态
5、绘制路径 
 */
class CGView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect);
        //1 获取上下文
        let context = UIGraphicsGetCurrentContext()
        //2 创建绘制路径对象
        let path = CGMutablePath()
        path.move(to: CGPoint.init(x: 10, y: 30))
        path.addLine(to: CGPoint.init(x: 10, y: 100))
        path.addLine(to: CGPoint.init(x: 150, y: 100))
        //3 添加路径到图形上下文
        context?.addPath(path)
        //4 设置图形上下文状态属性
        context?.setStrokeColor(red: 1, green: 0, blue: 1, alpha: 1)
        context?.setFillColor(red: 1, green: 1, blue: 0, alpha: 1)
        context?.setLineWidth(3)
        context?.setLineCap(CGLineCap.round)
        context?.setLineJoin(CGLineJoin.round)

        //设置线段样式
        //phase:虚线开始的位置  这里设置为0
        //lengths:虚线长度间隔
        let lengths: [CGFloat] = [5, 7] //长度间隔
        context?.setLineDash(phase: 0, lengths: lengths)
        //设置阴影
        let shadowColor = UIColor.gray.cgColor
        context?.setShadow(offset: CGSize.init(width: 2.0, height: 2.0), blur: 0.8, color: shadowColor)
        
        //5 绘制图像到指定图形上下文
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        
        
    }
    

}
