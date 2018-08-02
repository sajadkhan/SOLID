//
//  ImageHandler.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/2/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

///This is an image handler class. It does following tasks.
//1. Create some url for fetching the image.
//2. Request image from that url.
//3. Parse image data into UIImage that can be used with UIImageView
//4. Set that image to ImageView.

//There are a lot of things wrong with this class in term of SRP.
//1. It doesn't have single responsibilty.
//  It creates source for image
//  It fetches and parses the image
//  It set the image to the UI.

//It has more than one reason to change.

//Now we have to try to separate responsibilities
//Look at ImageMangerSRP.swift file 

class ImageHandler {
    
    //Image View
    var imageView: UIImageView?
    
    // Create url for image
    let url = URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!
    
    func run() {
        // Request image from server.
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: self.url)
            
            // Parse that image from whatever form (Data) to UIImage
            let image = UIImage(data: data)!
            
            // Display that image
            // As this is related to UI we are doing it on main thread.
            DispatchQueue.main.async {
                self.imageView?.image = image
            }
            
        }
        
    }
    
}
