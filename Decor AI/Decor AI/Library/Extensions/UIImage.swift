//
//  UIImage.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit
import Photos

extension UIImage {
    
    static func from(asset: PHAsset) -> UIImage? {
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.deliveryMode = .highQualityFormat
        options.resizeMode = .exact
        let size = CGSize(width: 100 * (300 / 72), height: 100 * (300 / 72))
        var resultImage: UIImage?
        manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: options) { image, _ in
            resultImage = image
        }
        return resultImage
    }
    
    /// Init method for creating UIImage of a given color with 1*1 size
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
}
