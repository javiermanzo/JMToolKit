//
//  UICollectionViewCell-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import Foundation

extension UICollectionViewCell: JMReusableIdentifier {
    static internal var cellNib: UINib {
        return UINib(nibName: self.reusableIdentifier, bundle: Bundle.main)
    }
}
