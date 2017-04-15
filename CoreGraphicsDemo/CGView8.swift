//
//  CGView8.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/14.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView8: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context: CGContext! = UIGraphicsGetCurrentContext()
        
        self.drawImage(context: context)
    }
    
    
    /// 平移、旋转、缩放
    ///
    /// - Parameter context:
    func drawImage(context: CGContext) {
        //保存初始状态
        context.saveGState()
        //形变step 1: 上下文向右移动100
        context.translateBy(x: 100, y: 0)
        //形变step 2：缩放0.8
        context.scaleBy(x: 0.8, y: 0.8)
        //形变step 3：旋转
        context.rotate(by: .pi/4/4)
        
        let image = UIImage.init(named: "jieping")
        //以下两个是UIKit 绘制
        //image?.draw(at: .init(x: 0, y: 100)) //从指定点开始绘制
//        image?.draw(in: .init(x: 10, y: 100, width: 300, height: 450)) //指定矩形绘制
        
        //以下是CoreGraphics绘制
        let height: CGFloat = 450
        let y: CGFloat = 100
        //图像绘制
        let rect = CGRect.init(x: 10, y: y, width: 300, height: height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0, y: -2*y - height)
        context.draw((image?.cgImage)!, in: rect)
        
    }

}
