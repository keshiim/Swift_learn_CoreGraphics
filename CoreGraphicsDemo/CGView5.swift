//
//  CGView5.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/12.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

/// 两种渐变方式
class CGView5: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context: CGContext! = UIGraphicsGetCurrentContext()
        
        self.drawLinearGradient(context: context)
    }
 
    func drawLinearGradient(context: CGContext) {
        //使用rgb颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let compoents: [CGFloat] = [ 248.0/255.0, 86.0/255.0, 86.0/255.0, 1,
                                     249.0/255.0, 127.0/255.0, 127.0/255.0, 1,
                                     1.0, 1.0, 1.0, 1.0 ]
        let locations: [CGFloat] = [0, 0.4, 1]
        
        
        /*
         指定渐变色
         space:颜色空间
         components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
         如果有三个颜色则这个数组有4*3个元素
         locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
         count:渐变个数，等于locations的个数
         */
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        /*
         绘制线性渐变
         context:图形上下文
         gradient:渐变色
         startPoint:起始位置
         endPoint:终止位置
         options:绘制方式,DrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
         DrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
         */
        context.drawLinearGradient(gradient!, start: .init(x: 0, y: self.frame.height/2), end: .init(x: self.frame.size.width, y: self.frame.height/2), options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
}
