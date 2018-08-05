//
//  ImagePersistenceDIP.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/5/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

//This is the version of ImagePersistence where we follow Dependency Inversion Principle.

//Higher Level Module
//Does not depend on lower level module
class ImagePersistence {
    let handler: ImageSaveHandler
    
    init(handler: ImageSaveHandler) {
        self.handler = handler
    }
    
    public func save(image: UIImage) -> Bool {
        return handler.save(image: image)
    }
}


//Abstraction
//Doesn't depend on details.
protocol ImageSaveHandler {
    func save(image: UIImage) -> Bool
}

//Now Details should depend upon abstraction

class FileHanndler: ImageSaveHandler {
    func save(image: UIImage) -> Bool {
        //Save to Disk file
        return true
    }
}

class GalleryHandler: ImageSaveHandler {
    func save(image: UIImage) -> Bool {
        //Save to Gallery
        return true
    }
}

class CloudHandler: ImageSaveHandler {
    func save(image: UIImage) -> Bool {
        //Save to Cloud
        return true
    }
}
