//
//  ViewController.swift
//  JuegoMemoria
//
//  Created by alumnos on 07/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgSetter: BGSet = BGSet()
        bgSetter.setBackground(view: self.view)
    }
}
