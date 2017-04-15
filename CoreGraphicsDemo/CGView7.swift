//
//  CGView7.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/14.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView7: UIView {
//例子中只是使用UIKit的封装方法进行叠加模式设置，更一般的方法当然是使用CGContextSetBlendMode(CGContextRef context, CGBlendMode mode)方法进行设置。
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect);
        
        let rect0 = CGRect.init(x: 0, y: 130.0, width: 320.0, height: 50.0)
        let rect1 = CGRect.init(x: 0, y: 390.0, width: 320.0, height: 50.0)
        
        let rect2  = CGRect.init(x: 20.0,  y: 50.0,  width: 10.0, height: 250.0)
        let rect3  = CGRect.init(x: 40.0,  y: 50.0,  width: 10.0, height: 250.0)
        let rect4  = CGRect.init(x: 60.0,  y: 50.0,  width: 10.0, height: 250.0)
        let rect5  = CGRect.init(x: 80.0,  y: 50.0,  width: 10.0, height: 250.0)
        let rect6  = CGRect.init(x: 100.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect7  = CGRect.init(x: 120.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect8  = CGRect.init(x: 140.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect9  = CGRect.init(x: 160.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect10 = CGRect.init(x: 180.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect11 = CGRect.init(x: 200.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect12 = CGRect.init(x: 220.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect13 = CGRect.init(x: 240.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect14 = CGRect.init(x: 260.0, y: 50.0,  width: 10.0, height: 250.0)
        let rect15 = CGRect.init(x: 280.0, y: 50.0,  width: 10.0, height: 250.0)
        
        let rect16 = CGRect.init(x: 30.0,  y: 310.0, width: 10.0, height: 250.0)
        let rect17 = CGRect.init(x: 50.0,  y: 310.0, width: 10.0, height: 250.0)
        let rect18 = CGRect.init(x: 70.0,  y: 310.0, width: 10.0, height: 250.0)
        let rect19 = CGRect.init(x: 90.0,  y: 310.0, width: 10.0, height: 250.0)
        let rect20 = CGRect.init(x: 110.0, y: 310.0, width: 10.0, height: 250.0)
        let rect21 = CGRect.init(x: 130.0, y: 310.0, width: 10.0, height: 250.0)
        let rect22 = CGRect.init(x: 150.0, y: 310.0, width: 10.0, height: 250.0)
        let rect23 = CGRect.init(x: 170.0, y: 310.0, width: 10.0, height: 250.0)
        let rect24 = CGRect.init(x: 190.0, y: 310.0, width: 10.0, height: 250.0)
        let rect25 = CGRect.init(x: 210.0, y: 310.0, width: 10.0, height: 250.0)
        let rect26 = CGRect.init(x: 230.0, y: 310.0, width: 10.0, height: 250.0)
        let rect27 = CGRect.init(x: 250.0, y: 310.0, width: 10.0, height: 250.0)
        let rect28 = CGRect.init(x: 270.0, y: 310.0, width: 10.0, height: 250.0)
        let rect29 = CGRect.init(x: 290.0, y: 310.0, width: 10.0, height: 250.0)
        
        UIColor.yellow.set()
        UIRectFill(rect0)
        UIColor.green.set()
        UIRectFill(rect1)
        UIColor.red.set()
        
        UIRectFillUsingBlendMode(rect2, CGBlendMode.clear)
        UIRectFillUsingBlendMode(rect3, CGBlendMode.color)
        UIRectFillUsingBlendMode(rect4, CGBlendMode.colorBurn)
        UIRectFillUsingBlendMode(rect5, CGBlendMode.colorDodge)
        UIRectFillUsingBlendMode(rect6, CGBlendMode.copy)
        UIRectFillUsingBlendMode(rect7, CGBlendMode.darken)
        UIRectFillUsingBlendMode(rect8, CGBlendMode.destinationAtop)
        UIRectFillUsingBlendMode(rect9, CGBlendMode.destinationIn)
        UIRectFillUsingBlendMode(rect10, CGBlendMode.destinationOut)
        UIRectFillUsingBlendMode(rect11, CGBlendMode.destinationOver)
        UIRectFillUsingBlendMode(rect12, CGBlendMode.difference)
        UIRectFillUsingBlendMode(rect13, CGBlendMode.exclusion)
        UIRectFillUsingBlendMode(rect14, CGBlendMode.hardLight)
        UIRectFillUsingBlendMode(rect15, CGBlendMode.hue)
        UIRectFillUsingBlendMode(rect16, CGBlendMode.lighten)
        
        UIRectFillUsingBlendMode(rect17, CGBlendMode.luminosity)
        UIRectFillUsingBlendMode(rect18, CGBlendMode.multiply)
        UIRectFillUsingBlendMode(rect19, CGBlendMode.normal)
        UIRectFillUsingBlendMode(rect20, CGBlendMode.overlay)
        UIRectFillUsingBlendMode(rect21, CGBlendMode.plusDarker)
        UIRectFillUsingBlendMode(rect22, CGBlendMode.plusLighter)
        UIRectFillUsingBlendMode(rect23, CGBlendMode.saturation)
        UIRectFillUsingBlendMode(rect24, CGBlendMode.screen)
        UIRectFillUsingBlendMode(rect25, CGBlendMode.softLight)
        UIRectFillUsingBlendMode(rect26, CGBlendMode.sourceAtop)
        UIRectFillUsingBlendMode(rect27, CGBlendMode.sourceIn)
        UIRectFillUsingBlendMode(rect28, CGBlendMode.sourceOut)
        UIRectFillUsingBlendMode(rect29, CGBlendMode.xor)
    }


}
