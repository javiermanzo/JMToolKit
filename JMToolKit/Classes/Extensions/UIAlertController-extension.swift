//
//  UIAlertController-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//


import UIKit

public extension UIAlertController {
    func addHeaderImageView(withImage image: UIImage) {
        //This will clear the current title
        self.title = "\n\n\n\n\n\n"
        var imageViewLength: CGFloat = 100.0
        imageViewLength = 125

        let imageView: UIImageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)

        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: imageViewLength))
        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: imageViewLength))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
    }

    static func showAlertRoot(type: UIAlertController.Style, title: String, description: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: type)

        for action in actions {
            alert.addAction(action)
        }
        if let appDelegate = UIApplication.shared.delegate,
            let window = appDelegate.window,
            let rootVC = window?.rootViewController {
            rootVC.present(alert, animated: true, completion: nil)
        }
    }
}
