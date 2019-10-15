//
//  SecondVC.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//


import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imagenes: [UIImage] = [#imageLiteral(resourceName: "Simpson2"),#imageLiteral(resourceName: "Simpson1"),#imageLiteral(resourceName: "Simpson5"),#imageLiteral(resourceName: "Simpson4"),#imageLiteral(resourceName: "Simpson6"),#imageLiteral(resourceName: "Simpson3")]
    
    override func viewDidLoad() {
        changeImage()
        super.viewDidLoad()
    }
    
    func changeImage()  {
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { timer in
            if index < self.imagenes.count{
                self.imageView.image = self.imagenes[index]
            }
            index += 1
        })
    }
}
