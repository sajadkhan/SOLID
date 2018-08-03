//
//  ImageOperationOCP.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/3/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

//This class is same as ImageOperation.swift except we are tryin to follow Open/Close principle here.

//This is abstraction, Every image operation should process an image and return the result.
//Every operation has its own implementation for processing an image.

//We don't have to modify any class when adding new operation. So we have a closure of change with respect to adding operations. There are other aspect we can think to apply OCP but for scope of this project we are not going to look at them. 

protocol ImageOperation {
    func process(image: UIImage) -> UIImage
}

///Scale Operation
class ScaleOperation: ImageOperation {
    private let scale: CGFloat
    init(_ scale: CGFloat) {
        self.scale = scale
    }
    func process(image: UIImage) -> UIImage {
        return UIImage.scale(image: image, by: scale)
    }
}

///Resize Operation
class ResizeOperation: ImageOperation {
    private let size: CGSize
    init(_ size: CGSize) {
        self.size = size
    }
    func process(image: UIImage) -> UIImage {
        return UIImage.resize(image: image, with: size)
    }
}

class ImageProcessor {
    private var operations = [ImageOperation]()
    private var image: UIImage!
    
    //convenience intializer to add operations
    init(image: UIImage, operations: [ImageOperation]) {
        self.operations = operations
    }
    
    //convenience initializer to start with one operation
    init(image: UIImage, operation: ImageOperation) {
        self.operations.append(operation)
    }
    
    //Process all operation
    func run() {
        _ = operations.map { $0.process(image: image)}
    }
    
}
