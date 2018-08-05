//
//  ImagePersistence.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/5/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

//This is a class to save image to persistence storage
//This class is on higher level
class ImagePersistence {
    //Different storage methods
    func save(image: UIImage) {
        let fp = FilePersistence()
        _ = fp.saveImageToFile(image: image)
    }
}

//class at lower level
class FilePersistence {
    func saveImageToFile(image: UIImage) -> Bool{
        //Save Image to file
        return true
    }
}

//Now our higher level module Image Persistence is dependent on lower level module which is voilation of Dependency Inversion Principle, please see ImagePersistenceDIP.swift for the fix.

