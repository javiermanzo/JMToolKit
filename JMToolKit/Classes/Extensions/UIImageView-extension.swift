//
//  UIImageView-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

public extension UIImageView {
    func setImageWithAnimation(image: UIImage, animationDuration: Double = 0.3) {
        UIView.transition(with: self, duration: animationDuration, options: .transitionCrossDissolve, animations: { self.image = image }, completion: nil)
    }
}
