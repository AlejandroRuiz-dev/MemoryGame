//
//  ThirdVC.swift
//  JuegoMemoria
//
//  Created by alumnos on 11/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    @IBOutlet weak var labelFail: UILabel!
    
    @IBOutlet weak var botonPrueba: UIButton!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var image6: UIImageView!
    
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var stackViewLeft: UIStackView!
    
    @IBOutlet weak var stackViewCenter: UIStackView!
    
    @IBOutlet weak var stackViewRight: UIStackView!
    
    @IBOutlet weak var stackViewTotal: UIStackView!
    
    @IBOutlet weak var buttonPlace: UIButton!
    
    @IBOutlet weak var buttonEnd: UIButton!
    
    var imageViews: [UIImageView] = []
    var lifes = 9
    
    var index = 0
    
    override func viewDidLoad() {
        fill()
        super.viewDidLoad()
    }
    
    func fill() {
        var index = 0
        
        imageViews = [image1, image2, image3, image4, image5, image6, image7, image8, image9]
        
        for image in images{
            imageViews[index].image = image
            index += 1
        }
    }
    
    func chooseImage() -> UIImageView {
        var imageReturn: UIImageView = image1
        if index < imageViews.count {
            for image in imageViews{
                    image.isUserInteractionEnabled = true
                    if images[numbers[index]].isEqual(image.image!){
                    imageReturn = image
                }
            }
        }
        return imageReturn
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let touch: UITouch! = (touches.first as! UITouch)
        
        let location = touch.location(in: self.view)

        let imageMove = chooseImage()
        
        if touch.view == imageMove{
            imageMove.center =  substract(lhs: location, rhs: getCorrectCG())
            touchesMoved(touches, with: event)
        }else {
            lifes -= 1
            labelFail.text = "Fallo, tienes: " + String(lifes) + " vidas"
            labelFail.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { timer in
                self.labelFail.isHidden = true
            })
            if lifes <= 0{
                lose()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch: UITouch! = (touches.first as! UITouch)
        
        let location = touch.location(in: self.view)
        
        let imageMove = chooseImage()
        
        if touch.view == imageMove{
            buttonPlace.isEnabled = true
            buttonPlace.backgroundColor = #colorLiteral(red: 0.3183422059, green: 1, blue: 0.213919615, alpha: 1)
            
            imageMove.center =  substract(lhs: location, rhs: getCorrectCG())
        }
    }
    
    @IBAction func buttonPlaceUse(_ sender: UIButton) {
        buttonPlace.isEnabled = false
        buttonPlace.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        index += 1
        if index == 9 {
            buttonPlace.isHidden = true
            buttonEnd.setTitle("VICTORIA, pulsa para volver a jugar", for: .normal)
            buttonEnd.isHidden = false
        }
    }
    var correctCG = CGPoint(x:100, y: 130)
    
    func getCorrectCG() -> CGPoint {
        let imageToFind  = chooseImage()
        if stackViewLeft.contains(imageToFind){
            correctCG = CGPoint(x:35, y: 100)
        }
        else if stackViewCenter.contains(imageToFind){
            correctCG = CGPoint(x:145, y: 100)
            
        }
        else if stackViewRight.contains(imageToFind){
            correctCG = CGPoint(x:255, y: 100)
        }
        return correctCG
    }
    
    @IBAction func buttonEndUse(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func lose()   {
        labelFail.isEnabled = false
        buttonPlace.isHidden = true
        buttonEnd.setTitle("DERROTA, pulsa para volver a jugar", for: .normal)
        buttonEnd.isHidden = false
    }
    
    func substract(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
