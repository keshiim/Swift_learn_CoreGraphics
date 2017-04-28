//
//  ZMJLoaderButtonProgressView.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/26.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

let eps = 1e-6

protocol ZMJProgressing {
    var isPorgressing: Bool { get }
    
    var isComplete: Bool { get }
    
    var progress: CGFloat { get }
    
}

class ZMJLoaderButtonProgressView: UIView, ZMJProgressing {
    
    /// ZMJProgressing
    private(set) public var progress: CGFloat
    
    private(set) public var isComplete: Bool

    private(set) public var isPorgressing: Bool
    
    ///私有属性
    lazy var progressView: UIView = {
        let _progressView: UIView = UIView.init(frame: self.bounds)
        _progressView.center = self.center
        _progressView.backgroundColor = LoaderButtonDefaultColor
        _progressView.layer.cornerRadius = _progressView.frame.width / 2.0
        _progressView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        return _progressView
    }()
    
    lazy var successView: UIImageView = {
        let _successView: UIImageView = UIImageView.init(image: UIImage.init(named: "Success"))
        _successView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        _successView.alpha = 0
        _successView.center = self.center
        return _successView
    }()
    
    var gameTime: CADisplayLink?
    
    private var nextProgress: CGFloat {
        get {
            return self.nextProgress
        }
        
        set (newValue) {
            self.nextProgress = newValue
        }
    }

    private var circlePoint: CGPoint {
        get {
            return self.center
        }
    }
    
    private var circleRadius: CGFloat {
        get {
            return self.frame.width / 2.0
        }
    }
    
    private var count: uint
    
    /// 初始化方法
    ///
    /// - Parameter frame:
    override init(frame: CGRect) {
        //初始化参数
        isPorgressing = true
        isComplete = true
        progress = 0.0
        count = 0
        super.init(frame: frame)
        
        self.setNextProgress(nextProgress: 0.0)
        self.addSubview(self.successView)
        
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 画圆形边界
    func drawCircleBorder() {
        self.layer.borderWidth = 3.0
        self.layer.borderColor = LoaderButtonDefaultColor.cgColor
        self.layer.cornerRadius = self.frame.width / 2.0
    }
    
    
    /// 进度动画
    func useShapeLayer() -> Void {
        isPorgressing = true
        
        if fabs(Double(self.nextProgress) - Double(self.progress)) > eps {
            UIView.animate(withDuration: 6.18 * fabs(Double(self.nextProgress) - Double(self.progress)), delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.progressView.transform = CGAffineTransform.init(scaleX: self.nextProgress, y: self.nextProgress)
            }, completion: { (finished: Bool) in
                self.progress = self.nextProgress
                self.isPorgressing = false
                if self.progress == 1 {
                    self.isComplete = true
                    self.endAnimation()
                }
            })
        }
    }
    
    /// 动画关闭方法
    func startAnimation() -> Void {
        if self.gameTime != nil {
            self.stopAnimation()
        }
        self.gameTime = CADisplayLink.init(target: self, selector: #selector(refreshAnimation))
        self.gameTime?.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }
    
    
    /// 动画关闭方法
    func stopAnimation() {
        self.gameTime?.invalidate()
        self.gameTime = nil;
    }
    
    /// 刷新动画，判断是否需要增加动点
    func refreshAnimation() -> Void {
        if !self.isPorgressing {
            self.stopAnimation()
        }
        
        count += 1
        count %= 50
        if count == 40 {
            self.readyPointAnimation(center: ZMJLoaderMath.calcBeginPoint(O: self.circlePoint, radius: self.circleRadius, coefficent: 2))
        }
    }
    
    /// 进入动画，传入起始坐标点
    ///
    /// - Parameter center:
    func readyPointAnimation(center: CGPoint) {
        let pointRadius: CGFloat = 8.0
        let shap: CALayer = CALayer.init()
        shap.backgroundColor = LoaderButtonDefaultColor.cgColor
        shap.cornerRadius = pointRadius
        shap.frame = CGRect.init(x: center.x, y: center.y, width: pointRadius * 2, height: pointRadius * 2)
        self.layer.addSublayer(shap)
        self.runPointAnimation(point: shap)
    }
    
    /// 启动动画，向中心吸收
    ///
    /// - Parameter point:
    func runPointAnimation(point: CALayer) {
        let keyAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        keyAnimation.path = self.makePointPath(point: point).cgPath
        keyAnimation.fillMode = kCAFillModeForwards
        keyAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        keyAnimation.duration = 2
        keyAnimation.isRemovedOnCompletion = true
        point.add(keyAnimation, forKey: "moveAnimation")
        
        //移除
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            point.removeFromSuperlayer()
        }
    }
    
    /// 生成曲线路径
    ///
    /// - Parameter point: point
    /// - Returns: path
    func makePointPath(point: CALayer) -> UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: point.position)
        //直线
        path.addLine(to: self.circlePoint)
        //二元曲线
        path.addQuadCurve(to: self.circlePoint, controlPoint: ZMJLoaderMath.calcControlPoint(one: self.circlePoint, two: point.position, isRandom: true))
        return path
    }
    
    /// 结束动画
    func endAnimation() {
        self.layer.borderColor = UIColor.clear.cgColor
        let viewShot: UIView = NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver .archivedData(withRootObject: self.progressView)) as! UIView
        viewShot.alpha = 0.4
        viewShot.layer.cornerRadius = viewShot.frame.width / 2
        viewShot.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        
        self.addSubview(viewShot)
        UIView.animate(withDuration: 0.9, delay: 1.2, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            self.progressView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { (finish: Bool) in
            
            UIView.animate(withDuration: 2.1, animations: { 
                viewShot.transform = CGAffineTransform.init(scaleX: 3, y: 3)
                viewShot.alpha = 0
                self.successView.alpha = 1
            }, completion: { (finish: Bool) in
                viewShot.removeFromSuperview()
            })
            
            UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
                self.progressView.transform = CGAffineTransform.init(scaleX: 1.8, y: 1.8)
                self.progressView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            }, completion: { (finish: Bool) in
                
            })
        }
    }
    
    public func setNextProgress(nextProgress: CGFloat) {
        self.nextProgress = nextProgress
        self.useShapeLayer()
    }
    

}
