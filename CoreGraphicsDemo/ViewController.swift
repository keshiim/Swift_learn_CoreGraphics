//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/1.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit
class View1: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("view 1")
        if self.point(inside: point, with: event) {
            NSLog("in View 1")
        }
        
//        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
        for subview in self.subviews {
            if subview is UIButton {
                let convertedPoint: CGPoint! = subview.convert(point, from: self)
                if (subview.hitTest(convertedPoint, with: event) != nil) {
                    return subview
                }
            }
        }
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        return super.point(inside: point, with: event)
    }
}

class View2: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("view 2")
        return super.hitTest(point, with: event)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cgView = CGView.init(frame: CGRect.init(x: 0, y: 44, width: 160, height: 110))
        cgView.backgroundColor = UIColor.white
//        self.view.addSubview(cgView)
        
        let cgView2 = CGView2.init(frame: CGRect.init(x: 160, y: 44, width: 160, height: 110))
        cgView2.backgroundColor = UIColor.white
//        self.view.addSubview(cgView2)
        
        let cgView3 = CGView3.init(frame: CGRect.init(x: 0, y: 164, width: self.view.frame.width, height: self.view.frame.height - 110))
        cgView3.backgroundColor = UIColor.white
//        self.view.addSubview(cgView3)
        
        let cgView4 = CGView4.init(frame: .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        cgView4.backgroundColor = UIColor.white
//        self.view.addSubview(cgView4)
        
        let cgView5 = CGView5.init(frame: .init(x: 0, y: 64, width: self.view.frame.width, height: 100))
        cgView5.backgroundColor = UIColor.white
//        self.view.addSubview(cgView5)
        
        let cgView6 = CGView6.init(frame: .init(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100))
        cgView6.backgroundColor = UIColor.white
//        self.view.addSubview(cgView6)
        
        let cgView7 = CGView7.init(frame: .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        cgView7.backgroundColor = UIColor.white
//        self.view.addSubview(cgView7)
        
        let cgView8 = CGView8.init(frame: .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        cgView8.backgroundColor = UIColor.white
//        self.view.addSubview(cgView8)
        
        
        let image = self.drawImageAtImageContext()
        let imageView = UIImageView.init(image: image)
        imageView.center = CGPoint.init(x: 160, y: 284)
//        self.view.addSubview(imageView)
        
        //self.drawContentToPdfContext()
        
        let view1 = View1.init(frame: .init(x: 0, y: 44, width: self.view.frame.width, height: 44))
        view1.backgroundColor = UIColor.red
//        self.view.addSubview(view1)
        
        let view2 = View2.init(frame: .init(x: 0, y: 30, width: 100, height: 44))
        view2.backgroundColor = UIColor.blue
//        view1.addSubview(view2)
        
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 100, y: 30, width: 60, height: 44)
        button.setTitle("aaaa", for: UIControlState.normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonAction(button:)), for: UIControlEvents.touchUpInside)
//        view1.addSubview(button)
        let loadButton: ZMJLoaderButton = ZMJLoaderButton.init(frame: .init(x: 0, y: 0, width: 150, height: 150))
        loadButton.center = self.view.center
        self.view.addSubview(loadButton)
    }
    
    func buttonAction(button: UIButton) {
        print("button action")
    }
    /// 绘制到位图
    ///
    /// - Returns: UIImage
    func drawImageAtImageContext() -> UIImage {
        let size = CGSize.init(width: 300, height: 200)
        //获得一个位图图形上下文
        UIGraphicsBeginImageContext(size)
        
        let img = UIImage.init(named: "jieping")
        img?.draw(in: .init(x: 0, y: 0, width: 300, height: 200))
        
        //添加水印
        let context: CGContext! = UIGraphicsGetCurrentContext()
        context.move(to: .init(x: 200, y: 178))
        context.addLine(to: .init(x: 365, y: 178))
        
        UIColor.red.setStroke()
        context.setLineWidth(2)
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        let str = "ZMJASON"
        (str as NSString).draw(in: .init(x: 200, y: 158, width: 100, height: 30), withAttributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18), NSForegroundColorAttributeName: UIColor.red])
        //返回绘制的新图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭图形上下文
        UIGraphicsEndImageContext()
        return newImage!;
    }

    
    /// 绘制PDF
    func drawContentToPdfContext() {
        //沙盒路径
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let path = (paths.first! as NSString).appendingPathComponent("test.pdf")
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        
        //启用pdf图形上下文
        /**
         path:保存路径
         bounds:pdf文档大小，如果设置为CGRectZero则使用默认值：612*792
         pageInfo:页面设置,为nil则不设置任何信息
         */
        UIGraphicsBeginPDFContextToFile(path, .zero, [kCGPDFContextAuthor as AnyHashable: "JASON"])
        //由于pdf文档是分页的，所以首先要创建一页画布供我们绘制
        UIGraphicsBeginPDFPage()
        let title = "开心的学习 CoreGraphics 开心的学习Swift"
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        
        (title as NSString).draw(in: .init(x: 26, y: 20, width: 300, height: 50), withAttributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18), NSParagraphStyleAttributeName: style])
        
        let content = "Learn about Apple products, view online manuals, get the latest downloads, and more. Connect with other Apple users, or get service, support, and professional advice from Apple."
        let style2 = NSMutableParagraphStyle()
        style2.alignment = NSTextAlignment.left
        (content as NSString).draw(in: .init(x: 26, y: 56, width: 300, height: 255), withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSParagraphStyleAttributeName: style2, NSForegroundColorAttributeName: UIColor.gray])
        
        let img = UIImage.init(named: "jieping")
        img?.draw(in: .init(x: 316, y: 20, width: 290, height: 305))
        
        let img2 = UIImage.init(named: "jieping")
        img2?.draw(in: .init(x: 6, y: 320, width: 600, height: 629))
        
        //结束上下文
        UIGraphicsEndPDFContext()
        
        let scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize = CGSize.init(width: self.view.frame.width + 200, height: 800)
        //把PDF显示在view上
        let ctView = CGView10.init(frame: .init(x: 0, y: 64, width: self.view.frame.width + 200, height: 800))
        ctView.path = path
        scrollView.addSubview(ctView)
        self.view.addSubview(scrollView)
        ctView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

