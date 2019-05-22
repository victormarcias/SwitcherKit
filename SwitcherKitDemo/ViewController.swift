//
//  ViewController.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = OSSwitchable<Int>(1)
            .iOS12(12)
            .iOS11(11)
            .iOS10(10)
            .iOS9(9)
            .custom(99) { () -> Bool in
                return false
            }
        
        print(value.value)
    }

}

