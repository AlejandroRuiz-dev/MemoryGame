//
//  SecondVC.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

var images: [UIImage] = [#imageLiteral(resourceName: "Simpson2"),#imageLiteral(resourceName: "Simpson1"),#imageLiteral(resourceName: "Simpson5"),#imageLiteral(resourceName: "Simpson4"),#imageLiteral(resourceName: "Simpson6"),#imageLiteral(resourceName: "Simpson3"),#imageLiteral(resourceName: "simpson7"),#imageLiteral(resourceName: "simpson8"),#imageLiteral(resourceName: "simpson9")]

var numbers: [Int] = []

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        changeImage()
    }
    
    
    func getArrayNumbers() -> [Int] {
        var numeros: [Int] = []
        for i in 0...images.count-1{
            numeros.append(i)
        }
        numeros.shuffle()
        
        return numeros
    }
    
    
    func changeImage()  {
        numbers = getArrayNumbers()
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { timer in
            if index < images.count{
                self.imageView.image = images[numbers[index]]
            }
            index += 1
        })
    }
}
