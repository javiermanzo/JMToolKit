//
//  JMReusableIdentifier.swift
//  JMToolKit
//
//  Created by Javier Manzo on 09/11/2018.
//  Copyright © 2018 Javier Manzo. All rights reserved.
//

import Foundation

protocol JMReusableIdentifier {
    static var reusableIdentifier: String { get }
}

extension JMReusableIdentifier {
    static var reusableIdentifier: String {
        return "\(self)"
    }
}
