//
//  ThirdVC.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var botonPrueba: UIButton!
    
    @IBOutlet weak var image1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fill() {
        var index = 0
        image1.image = images[0]
        index += 1
        
    }
    @IBAction func buttonBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
