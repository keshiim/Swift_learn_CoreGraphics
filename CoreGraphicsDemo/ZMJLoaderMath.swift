//
//  ZMJLoaderMath.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/27.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class ZMJLoaderMath: NSObject {

    
    /// 计算欧几里得距离
    ///
    /// - Parameters:
    ///   - x: x description
    ///   - y: y description
    /// - Returns: 返回两点的距离
    public class func calcDistance(from x: CGPoint, to y: CGPoint) -> CGFloat {
        let a1 = x.x - y.x
        let a2 = x.y - y.y
        
        return sqrt(a1 * a1 + a2 * a2)
    }
    
    /// 计算斜度 cosθ
    ///
    /// - Parameters:
    ///   - a1:
    ///   - a2:
    /// - Returns:
    public class func calcGradient(a1: CGPoint, a2: CGPoint) -> CGFloat {
        return (a1.x - a2.x) / (a1.y - a2.y)
    }
    /// 计算Control Point Positon
    ///
    /// - Parameters:
    ///   - o1: 第一点
    ///   - o2: 第二点
    /// - Returns: 计算后的控制点
    public class func calcControlPoint(one o1: CGPoint, two o2: CGPoint) -> CGPoint {
        return self.calcControlPoint(one: o1, two: o2, isRandom: false)
    }
    
    /// 计算随机控制点
    ///
    /// - Parameters:
    ///   - o1:
    ///   - o2:
    ///   - isRandom: bool类型随机参数
    /// - Returns: 控制地(随机)
    public class func calcControlPoint(one o1: CGPoint, two o2: CGPoint, isRandom: Bool) -> CGPoint {
        let o_centre = CGPoint.init(x: (o1.x + o2.x) / 2, y: (o1.y + o2.y) / 2)
        let d = self.calcDistance(from: o_centre, to: o1)
        var k = d / 40
        if isRandom {
            let isRandom_int = arc4random() % 2
            if isRandom_int == 1 {
                k = -k
            }
        }
        let new_x = (o1.y - o2.y) / 2 / k + (o1.x + o2.x) / 2
        let new_y = -((o1.x - o2.x) / 2 / k - (o1.y + o2.y) / 2)//-((o1.x - o2.x) / 2 / k - (o1.y + o2.y) / 2)
        
        print("控制点：\(CGPoint.init(x: new_x, y: new_y))")
        return CGPoint.init(x: new_x, y: new_y)
    }
    
    
    /// 计算随机起始点
    ///
    /// - Parameters:
    ///   - O: 相对中心点
    ///   - r: 起始半径
    ///   - c: 半径倍数
    /// - Returns: 随机起始点
    public class func calcBeginPoint(O: CGPoint, radius r: CGFloat, coefficent c: CGFloat) -> CGPoint {
        let dis = r * c
        var ans: CGPoint
        
        //生成角度
        let angel = arc4random() % 360
        var theta: Double
        
        if angel <= 180 {
            theta = Double(angel) / 180 * .pi
            ans = CGPoint.init(x: O.x + CGFloat(Double(dis) * cos(theta)), y: O.y - CGFloat(Double(dis) * sin(theta)))
        } else {
            theta = Double(360 - angel) / 180 * .pi
            ans = CGPoint.init(x: O.x + CGFloat(Double(dis) * cos(theta)), y: O.y + CGFloat(Double(dis) * sin(theta)))
        }
        
        return ans
    }
}
