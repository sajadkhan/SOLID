//
//  ImageOperation.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/3/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

// This class perform different operation on an image like scaling, rotating, or resizing

class ImageProcessor {
    //Image to perform operations on
    var image: UIImage!
    
    //At initialization we provide image
    init(with image:UIImage) {
        self.image = image
    }
    
    //Scale the image
    func scaleBy(_ scale: CGFloat) {
        self.image = UIImage.scale(image: image, by: scale)
    }
    
    //Rotate the image
    func rotate(_ angle: CGFloat) {
        self.image = UIImage.rotate(image: image, at: angle)
    }
    
    //Resize the image
    func resize(_ size: CGSize) {
        self.image = UIImage.resize(image: image, with: size)
    }
    
    //What if we want to add more operations
    //We'll modifiy this class which is voilation of OCP
    //See ImageOperationOCP.swift
}
