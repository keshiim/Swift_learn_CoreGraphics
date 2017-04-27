//
//  ZMJLoaderButtonProgressView.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/26.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

protocol ZMJProgressing {
    var isPorgressing: Bool { get }
    
    var isComplete: Bool { get }
    
    var progress: CGFloat { get }
    
}

class ZMJLoaderButtonProgressView: UIView, ZMJProgressing {
    
    /// ZMJProgressing
    public var progress: CGFloat
    
    public var isComplete: Bool

    public var isPorgressing: Bool
    
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
    
    lazy var gameTime: CADisplayLink = {
        let _gameTime: CADisplayLink = CADisplayLink.init(target: self, selector: #selector(refreshAnimation))
        _gameTime.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
        return _gameTime
    }()
    
    private var nextProgress: CGFloat {
        get {
            return self.nextProgress
        }
        
        set (setter) {
            self.nextProgress = setter
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
    
    
    override init(frame: CGRect) {
        //初始化参数
        isPorgressing = true
        isComplete = true
        progress = 0.0
        count = 0
        super.init(frame: frame)
        
        self.setNextProgress(nextProgress: 0.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setNextProgress(nextProgress: CGFloat) {
        self.nextProgress = nextProgress
        self.useShapeLayer()
    }
    
    func refreshAnimation() {
        
    }

}
