//
//  Bundle-extension.swift
//  JMToolKit
//
//  Created by Javier Manzo on 09/11/2018.
//  Copyright © 2018 Javier Manzo. All rights reserved.
//

import Foundation

private class BundleIdentifyingClass { }

extension Bundle {
    static func bundle() -> Bundle {
        return Bundle(for: BundleIdentifyingClass.self)
    }
}
