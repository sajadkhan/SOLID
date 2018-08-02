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
        let imageDisplay = ImageDisplay()
        imageDisplay.displayImage(from: ImageSource(with: url),
                                    in: imageView)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

