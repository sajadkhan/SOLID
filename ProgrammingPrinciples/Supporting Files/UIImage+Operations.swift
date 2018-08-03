//
//  AppDelegate.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/3/18.
//  Copyright © 2018 Sajad. All rights reserved.
//
import Foundation
import UIKit

extension UIImage {
    
    class func scale(image: UIImage, by scale:CGFloat) -> UIImage {
        let size = image.size
        let scaledSize = CGSize(width: size.width * scale, height: size.height * scale)
        
        let widthRatio  = scaledSize.width  / size.width
        let heightRatio = scaledSize.height / size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    class func resize(image: UIImage, with newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard image.size != newSize else { return image }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    //Github: norsez/UIImage+Rotation.swift
    class func rotate(image: UIImage, at angle: CGFloat) -> UIImage {
        let cgImage = image.cgImage!
        let LARGEST_SIZE = CGFloat(max(image.size.width, image.size.height))
        let context = CGContext.init(data: nil, width:Int(LARGEST_SIZE), height:Int(LARGEST_SIZE), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: cgImage.colorSpace!, bitmapInfo: cgImage.bitmapInfo.rawValue)!
        
        var drawRect = CGRect.zero
        drawRect.size = image.size
        let drawOrigin = CGPoint(x: (LARGEST_SIZE - image.size.width) * 0.5,y: (LARGEST_SIZE - image.size.height) * 0.5)
        drawRect.origin = drawOrigin
        var tf = CGAffineTransform.identity
        tf = tf.translatedBy(x: LARGEST_SIZE * 0.5, y: LARGEST_SIZE * 0.5)
        tf = tf.rotated(by: CGFloat(angle))
        tf = tf.translatedBy(x: LARGEST_SIZE * -0.5, y: LARGEST_SIZE * -0.5)
        context.concatenate(tf)
        context.draw(cgImage, in: drawRect)
        var rotatedImage = context.makeImage()!
        
        drawRect = drawRect.applying(tf)
        
        rotatedImage = rotatedImage.cropping(to: drawRect)!
        let resultImage = UIImage(cgImage: rotatedImage)
        return resultImage
        
    }
    
    //Change alpha
    class func alpha(image: UIImage, to value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

}
