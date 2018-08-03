//
//  ImageMangerSRP.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/2/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

//We can add other attributes which are only specific to a url source object.
//Like we might add query requirment to this protocol
//So this has only one reason to change i.e if our url sources needs to change
protocol URLSource {
    var url: URL { get set }
}

//This class has one responsibilty to provide source for an image
//It will only change if we change source or we want to have different sources.
struct ImageSource: URLSource {
    var url: URL
    
    init(with url: URL) {
        self.url = url
    }
}


//This class is responsible only for fetching url
//Only changes if we want to change or fetching mechanism
class URLFetcher {
    
    //This method perform fetch on separate queue.
    //So completion handler won't be called on the queue you called this function on
    public static func fetch(url: URL, completionHandler: @escaping (Data?) -> Void) {
        DispatchQueue.global().async {
            completionHandler(try? Data(contentsOf: url))
        }
    }
}

//Responsible for parsing an image data into image.
//Only changes if parsing mechanism changes
class ImageParser {
    public static func image(from data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}

//Responsible for creating an image from source
//Only changes if change Image creation logic
class ImageCreator {
    private let source: ImageSource?
    
    //Only possible to create it with a source
    init(with source: ImageSource) {
        self.source = source
    }
    
    //Create image from specified source
    func createImage(completionHandler: @escaping (UIImage?) -> Void) {
        URLFetcher.fetch(url: (source?.url)!) { data in
            completionHandler(ImageParser.image(from: data!))
        }
    }
}


//Responsible for displaying an image from an image source
//Only changes if displaying requirment changes
class ImageDisplay {
    
    //Method for displaying image from a source in imageView
    class func display(with creator:ImageCreator, in imageView: UIImageView) {
        
        //We dispatch to main queue because completion block will be called on other queue
        //as we are doing UI related task so its neccessary to dispatch to main queue.
        creator.createImage { image in
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}




