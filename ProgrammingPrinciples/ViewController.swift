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
        loadImage(url: CassiniURLs.saturn)
        
    }
    
    // Load image in the image view
    private func loadImage(url: URL) {
        let source = ImageSource(with: url)
        let creator = ImageCreator(with: source)
        ImageDisplay.display(with: creator, in: imageView)
    }
    
    // Perform some image operations
    private func peformOperationOnImage() {
        let scale = Scale(2.0)
        let alpha = Transparency(0.5)
    }
}

struct CassiniURLs {
    static let saturn = URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!
}

