//
//  ZMJLoaderButton.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/26.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

let LoaderButtonDefaultColor = UIColor.red

class ZMJLoaderButton: UIButton {
    
    lazy var arrow: CAShapeLayer = {
            let _arrow: CAShapeLayer = CAShapeLayer()
            _arrow.strokeColor = LoaderButtonDefaultColor.cgColor
            _arrow.lineWidth = 3
            _arrow.lineJoin = kCALineJoinRound
            _arrow.lineCap  = kCALineCapRound
            return _arrow
        
    }()
    
    private var progressView: ZMJLoaderButtonProgressView
    

    override init(frame: CGRect) {
        progressView = ZMJLoaderButtonProgressView.init(frame: frame)
    
        super.init(frame: frame)
        
        self.addSubview(self.progressView)
        self.addTarget(self, action: #selector(startUpDownLoadAction), for: UIControlEvents.touchUpInside)
        self.addArrow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func drawArrow() -> UIBezierPath {
        let startPos: CGFloat = self.frame.width / 3.0
        let centerPos: CGFloat = self.frame.height / 2.0
        
        let path: UIBezierPath = UIBezierPath.init()
        path.move(to: .init(x: centerPos, y: startPos))
        path.addLine(to: .init(x: centerPos, y: 2 * startPos))
        path.addLine(to: .init(x: startPos, y: centerPos))
        path.move(to: .init(x: centerPos, y: 2 * startPos))
        path.addLine(to: .init(x: 2 * startPos, y: centerPos))
        
        return path
    }
    
    @objc private func startUpDownLoadAction() {
        print("click")
        
        self.arrow.removeFromSuperlayer()
        self.progressView.setNextProgress(nextProgress: 1)
    }
    
    private func addArrow() {
        self.arrow.path = self.drawArrow().cgPath
        self.layer.addSublayer(self.arrow)
    }

}
