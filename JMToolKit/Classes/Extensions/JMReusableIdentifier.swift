//
//  JMReusableIdentifier.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import Foundation

public protocol JMReusableIdentifier {
    static var reusableIdentifier: String { get }
}

public extension JMReusableIdentifier {
    static var reusableIdentifier: String {
        return "\(self)"
    }
}
