//
//  ViewController.swift
//  NativeDemo
//
//  Created by Koncz Kristóf on 2017. 01. 18..
//  Copyright © 2017. Kristóf Koncz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloWorldLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hw = HWHelloWorld.create()
        helloWorldLabel.text = hw?.getHelloWorld()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

