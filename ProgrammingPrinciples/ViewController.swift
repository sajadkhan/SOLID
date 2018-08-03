//
//  ViewController.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/2/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadImage(url: CassiniURLs.saturn)
    }
    
    // Load image in the image view
    private func loadImage(url: URL) {
        let source = ImageSource(with: url)
        let creator = ImageCreator(with: source)
        ImageDisplay.display(with: creator, in: imageView) {
            self.performOperationOnImage()
        }
    }
    
    // Perform some image operations
    private func performOperationOnImage() {
        let scale = Scale(1.3)
        let alpha = Transparency(0.5)
        
        if let image = imageView.image {
            let processor = ImageProcessor(image: image, operations: [scale, alpha])
            let image = processor.run()
            imageView.image = image
        }
    }
}

struct CassiniURLs {
    static let saturn = URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!
}

