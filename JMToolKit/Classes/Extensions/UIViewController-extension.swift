//
//  UIViewController-extension.swift
//  JMToolKit
//
//  Created by Javier Manzo on 09/11/2018.
//  Copyright © 2018 Javier Manzo. All rights reserved.
//

import UIKit

public extension UIViewController {
    static func instanceWithDefaultNib() -> Self {
        let className = NSStringFromClass(self as AnyClass).components(separatedBy: ".").last
        return self.init(nibName: className, bundle: Bundle.main)
    }
    
    func isModal() -> Bool {
        return (self.presentingViewController?.presentedViewController == self)
    }
    
    func pushViewControllerAndRemoveSelfFromStack(viewController: UIViewController) {
        if var viewControllers = self.navigationController?.viewControllers,
            let index = viewControllers.index(of: self) {
            viewControllers.remove(at: index)
            viewControllers.append(viewController)
            self.navigationController?.viewControllers = viewControllers
        }
    }
    
    func removeFromStack() {
        if var viewControllers = self.navigationController?.viewControllers,
            let index = viewControllers.index(of: self) {
            viewControllers.remove(at: index)
            self.navigationController?.viewControllers = viewControllers
        }
    }
}

