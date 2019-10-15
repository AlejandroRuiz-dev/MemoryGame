//
//  ThirdVC.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var Ejemplo: UIImageView!
    
    @IBAction func buttonBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
