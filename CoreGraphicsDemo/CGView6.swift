//
//  CGView6.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/14.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

/// 径向渐变绘制
class CGView6: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let context: CGContext! = UIGraphicsGetCurrentContext()
        
        self.drawRadialGradient(context: context)
        self.drawRectWithLinearGradientFill(context: context)
    }

    
    /// 径向绘制
    ///
    /// - Parameter context: CGContext
    func drawRadialGradient(context: CGContext) {
        //使用rbg颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let componets: [CGFloat] = [ 248.0/255.0,86.0/255.0,86.0/255.0,1,
                                     249.0/255.0,127.0/255.0,127.0/255.0,1,
                                     1.0,1.0,1.0,1.0]
        let locations: [CGFloat] = [0, 0.4, 1.0]
        /*
         指定渐变色
         space:颜色空间
         components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
         如果有三个颜色则这个数组有4*3个元素
         locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
         count:渐变个数，等于locations的个数
         */
        let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: componets, locations: locations, count: locations.count)
        
        /*
         绘制线性渐变
         context:图形上下文
         gradient:渐变色
         startPoint:起始位置
         startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
         endCenter:终点位置（通常和起始点相同，否则会有偏移）
         endRadius:终点半径（也就是渐变的扩散长度）
         options:绘制方式,DrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
         DrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
         */
        context.drawRadialGradient(gradient!, startCenter: .init(x: 100, y: 100), startRadius: 0, endCenter: .init(x: 100, y: 100), endRadius: 80, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
    
    
    /// 绘制一个矩形填充渐变
    ///
    /// - Parameter context:
    func drawRectWithLinearGradientFill(context: CGContext) {
        //使用颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        //裁剪一处矩形用于显示，注意：先裁剪，再调用渐变
        //context.clip(to: .init(x: 20, y: 150, width: 280, height: 300))
        //裁剪也可以用UIKit对应的方发
        UIRectClip(.init(x: 20, y: 250, width: 300, height: 300))
        
        let compoents: [CGFloat] = [ 248.0/255.0,86.0/255.0,86.0/255.0,1,
                                     249.0/255.0,127.0/255.0,127.0/255.0,1,
                                     1.0,1.0,1.0,1.0]
        let locations: [CGFloat] = [0, 0.4, 1.0]
        let gradient: CGGradient! = CGGradient.init(colorSpace: colorSpace, colorComponents: compoents, locations: locations, count: locations.count)
        
        context.drawLinearGradient(gradient, start: .init(x: 20, y: 250), end: .init(x: 320, y: 300), options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
    }

}
