//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Jason on 2017/4/1.
//  Copyright © 2017年 Jason. All rights reserved.
//

import UIKit

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
        self.view.addSubview(cgView5)
        
        let cgView6 = CGView6.init(frame: .init(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100))
        cgView6.backgroundColor = UIColor.white
        self.view.addSubview(cgView6)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

