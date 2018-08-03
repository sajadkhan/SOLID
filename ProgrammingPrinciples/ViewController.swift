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
        
        let url = URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!
        
        loadImage(url: url)
    
    }
    
    // Load image in the image view
    private func loadImage(url: URL) {
        let source = ImageSource(with: url)
        let creator = ImageCreator(with: source)
        ImageDisplay.display(with: creator, in: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

