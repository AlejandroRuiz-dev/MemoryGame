
import Foundation
import UIKit

class BGSet{
    public func setBackground(view: UIView)  {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "fondo.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        backgroundImage.blur()
        backgroundImage.alpha = 1.5
        view.insertSubview(backgroundImage, at: 0)
    }
}
extension UIImageView{
    public func blur()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
