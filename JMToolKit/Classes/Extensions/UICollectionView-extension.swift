//
//  UICollectionView-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func registerCellClass<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }

    func registerCellNib<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.cellNib, forCellWithReuseIdentifier: T.reusableIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T? {
        if let cell = self.dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T {
            return cell
        }
        return nil
    }
}
