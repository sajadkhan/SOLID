//
//  ImagePersistence.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/4/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

class ImageDecorator {
    //Image to decorate
    private let image: UIImage
    
    //Intialize with an image.
    init(with image: UIImage) {
        self.image = image
    }
    
    //Apply the passed filter and return the result image.
    //If someone passess BoxBlur or Gaussian blur filter this will work fine so we are not voilating LSP.
    func apply(filter: BlurFilter) -> UIImage {
        return filter.apply(on: image)
    }
}

//A defualt blur filter
//For demo perpose we are applying some demo filters
//Blur is alpha = 0.9
//Box blur is alpha = 0.5
//Gaussian blur is alpha = 2.0

class BlurFilter {
    //Some filter related details which would be common in all the filters.
    //Intensity is not use but ofcourse in real case scinerio it will be used.
    var intensity: CGFloat = 1.0
    
    //Applying of filter.
    func apply(on image: UIImage) -> UIImage {
        return UIImage.alpha(image: image, to: 0.9)
    }
}

//These inherited filter has Preconditions not stronger than of base class.
//Or Post

class BoxBlurFilter: BlurFilter {
    override func apply(on image: UIImage) -> UIImage {
        return UIImage.alpha(image: image, to: 0.5)
    }
}

class GaussianBlurFilter: BlurFilter {
    override func apply(on image: UIImage) -> UIImage {
        return UIImage.alpha(image: image, to: 0.2)
    }
}


