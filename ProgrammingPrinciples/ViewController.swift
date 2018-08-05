//
//  ViewController.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/2/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageInteraction: ImageZoomInteration?

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            //Add ImageInteractions
           imageInteraction = ImageZoomInteration(with: imageView)
        }
    }
   
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
        ImageDisplay.display(with: creator, in: imageView)
    }
    
    @IBAction func operationsButtonPressed(_ sender: Any) {
        self.performOperationOnImage()
    }
    
    // Perform some image operations
    private func performOperationOnImage() {
        let scale = Scale(0.5)
        let alpha = Transparency(0.5)
        
        if let image = imageView.image {
            let processor = ImageProcessor(image: image, operations: [scale, alpha])
            let image = processor.run()
            imageView.image = image
        }
    }
    
    @IBAction func filterTap(_ sender: UIButton) {
        applyAFilter()
    }
    
    // Apply some filter
    private func applyAFilter() {
        if let image = imageView.image {
            //setup decorator
            let decorator = ImageDecorator(with: image)
            
            //create some filter
            let boxBlur = BoxBlurFilter()
            let gaussianBlur = GaussianBlurFilter()
            
            //apply them
            //for showing LSP applying them both. See ImageDecorator.swift
            var image = decorator.apply(filter: boxBlur)
            image = decorator.apply(filter: gaussianBlur)
            
            imageView.image = image
        }
    }
    
    
    @IBAction func saveTap(_ sender: UIButton) {
        if let image = imageView.image {
            //Create handler
            let handler = GalleryHandler()
            
            //Use it to initialize image persistence object
            let imagePersistence = ImagePersistence(handler: handler)
            
            //Save
            //It won't save because save operation are not implemented yet.
            showImageSaveOperationFeedback(success: imagePersistence.save(image: image))
            
        }
    }
    
    private func showImageSaveOperationFeedback(success: Bool) {
        let title = success ? "Success" : "Failed"
        let message = success ? "Image was saved." : "Sorry, failed to save the Image."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}

struct CassiniURLs {
    static let saturn = URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!
}

