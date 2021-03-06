//
//  UITableViewCell-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

extension UITableViewCell: JMReusableIdentifier {
    static internal var cellNib: UINib {
        return UINib(nibName: self.reusableIdentifier, bundle: Bundle.main)
    }
}
