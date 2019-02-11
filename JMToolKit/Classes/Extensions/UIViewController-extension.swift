//
//  UIViewController-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

extension UIViewController {
    static public func instanceWithDefaultNib() -> Self {
        let className = NSStringFromClass(self as AnyClass).components(separatedBy: ".").last
        return self.init(nibName: className, bundle: Bundle.main)
    }

    public func isModal() -> Bool {
        return (self.presentingViewController?.presentedViewController == self)
    }

    public func pushViewControllerAndRemoveSelfFromStack(viewController: UIViewController) {
        if var viewControllers = self.navigationController?.viewControllers,
            let index = viewControllers.index(of: self) {
            viewControllers.remove(at: index)
            viewControllers.append(viewController)
            self.navigationController?.viewControllers = viewControllers
        }
    }

    public func removeFromStack() {
        if var viewControllers = self.navigationController?.viewControllers,
            let index = viewControllers.index(of: self) {
            viewControllers.remove(at: index)
            self.navigationController?.viewControllers = viewControllers
        }
    }

    public func addKeyboardObservers() {
        NotificationCenter.default.addObserver( self, selector: .keybaordWillShow, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: .keyboardWillHide, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc open func keyboardWillShow(notification: NSNotification) {
        // override this method
    }

    @objc open func keyboardWillHide(notification: NSNotification) {
        // override this method
    }
}

fileprivate extension Selector {
    static let keybaordWillShow =
        #selector(UIViewController.keyboardWillShow(notification:))

    static let keyboardWillHide =
        #selector(UIViewController.keyboardWillHide(notification:))

}
