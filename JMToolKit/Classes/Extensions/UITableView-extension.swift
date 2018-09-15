//
//  UITableView-extension.swift
//  JMToolKit
//
//  Created by Javier Manzo on 09/11/2018.
//  Copyright © 2018 Javier Manzo. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCellClass<T: UITableViewCell>(_: T.Type) {
        self.register(T.cellNib, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T? {
        if let cell = self.dequeueReusableCell(withIdentifier: T.reusableIdentifier) as? T {
            return cell
        } else {
            return nil
        }
    }
    
    func clearExtraSeparators() {
        self.tableFooterView = UIView()
    }
    
    func scrollToBottom(section: Int, animated: Bool){
        let elements = self.numberOfRows(inSection: section)
        if elements > 0 {
            DispatchQueue.main.async {
                let rowIndex = elements - 1
                let indexPath = IndexPath(row: rowIndex, section: section)
                self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
}
