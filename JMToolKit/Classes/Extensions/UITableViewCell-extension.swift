//
//  UITableViewCell-extension.swift
//  JMToolKit
//
//  Created by Javier Manzo on 09/11/2018.
//  Copyright © 2018 Javier Manzo. All rights reserved.
//

import UIKit

extension UITableViewCell: JMReusableIdentifier {
    static internal var cellNib: UINib {
        return UINib(nibName: self.reusableIdentifier, bundle: Bundle.main)
    }
}
