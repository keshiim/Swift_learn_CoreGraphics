//
//  CGView10.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/14.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

class CGView10: UIView {

    var path: String!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: self.bounds.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        let url = NSURL.init(fileURLWithPath: path) as CFURL
        let pdf: CGPDFDocument! = CGPDFDocument.init(url)
        let page = pdf?.page(at: 1)
        context?.saveGState()
        context?.drawPDFPage(page!)
        context?.restoreGState()
        
    }

}
