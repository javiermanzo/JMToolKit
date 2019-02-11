//
//  UITableView-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

public extension UITableView {
    func registerCellClass<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reusableIdentifier)
    }

    func registerCellNib<T: UITableViewCell>(_: T.Type) {
        self.register(T.cellNib, forCellReuseIdentifier: T.reusableIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T? {
        if let cell = self.dequeueReusableCell(withIdentifier: T.reusableIdentifier) as? T {
            return cell
        }
        return nil
    }

    func clearExtraSeparators() {
        self.tableFooterView = UIView()
    }

    func scrollToBottom(section: Int? = nil, animated: Bool) {
        let sectionPosition: Int
        if let section = section {
            sectionPosition = section
        } else {
            sectionPosition = self.numberOfSections > 0 ? self.numberOfSections - 1 : 0
        }
        let elements = self.numberOfRows(inSection: sectionPosition)
        if elements != NSNotFound && elements > 0 {
            DispatchQueue.main.async {
                let rowIndex = elements - 1
                let indexPath = IndexPath(row: rowIndex, section: sectionPosition)
                self.scrollToRow(at: indexPath, at: .top, animated: animated)
            }
        }
    }
}
