//
//  Data-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import Foundation

public extension Data {
    func fileSize(unit: ByteCountFormatter.Units = .useKB) -> String {
        let bcf1 = ByteCountFormatter()
        bcf1.allowedUnits = [unit]
        bcf1.countStyle = .file
        let size = bcf1.string(fromByteCount: Int64(self.count))
        return size
    }
}
