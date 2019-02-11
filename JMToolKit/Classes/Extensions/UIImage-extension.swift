//
//  UIImage-extension.swift
//  JMToolKit
//
//  Copyright © 2019 Javier Manzo. All rights reserved.
//

import UIKit

public extension UIImage {
    func imageFileSize() -> String? {
        if let imageData = self.pngData() {
            return imageData.fileSize()
        }
        return nil
    }

    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        if let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }

    func compressTo(expectedSizeInKB: Int) -> Data? {
        let sizeInBytes = expectedSizeInKB * 1024
        var needCompress: Bool = true
        var imgData: Data = Data()
        var compressingValue: CGFloat = 1.0

        while (needCompress && compressingValue > 0.0) {
            if let data: Data = self.jpegData(compressionQuality: compressingValue) {
                print("Compression =", compressingValue)
                print("In compressing quality loop, image size =", data.fileSize())
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }

        if (imgData.count < sizeInBytes) {
            return imgData
        }
        return nil
    }

    func saveImageToGallery() {
        if let imageData = self.pngData(),
            let image = UIImage(data: imageData) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
