//
//  UIView-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

public extension UIView {
    static func instanceWithDefaultNib<T: UIView>() -> T? {
        if let className = NSStringFromClass(self as AnyClass).components(separatedBy: ".").last {
            return UINib(
                nibName: className,
                bundle: Bundle.main
                ).instantiate(withOwner: nil, options: nil)[0] as? T
        } else {
            return nil
        }
    }

    func setUpShadow(color: UIColor = .lightGray, opacity: Float = 0.4, offset: CGSize = CGSize.zero) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 1
    }

    func roundCorners(cornerRadius: CGFloat = 4, clipsToBounds: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }

    //Only for perfect square views (width == height)
    func circleView() {
        let cornerRadius = self.frame.size.width / 2
        self.roundCorners(cornerRadius: cornerRadius)
    }

    func setUpBorder(width: CGFloat = 1, color: UIColor = .gray) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

    func removeAnimated(duration: Float = 0.3, delay: Float = 0.0) {
        guard let _ = self.superview else { return }
        UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), animations: {
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }

    func pulse(bounce: Bool = true, inDuration: TimeInterval = 0.2, outDuration: TimeInterval = 0.1, scale: CGFloat = 0.9, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: inDuration, animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { (comp) in
            if bounce {
                UIView.animate(withDuration: outDuration, animations: {
                    self.transform = .identity
                }, completion: completion)
            } else {
                completion?(comp)
            }
        })
    }
}
