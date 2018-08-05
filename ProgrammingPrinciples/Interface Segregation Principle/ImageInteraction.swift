//
//  ImageInteraction.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/5/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import UIKit

//A protocol to implement gesture handling on a view
protocol Interaction {
    //View to dectect gestures on
    var view: UIView { get set }
    
    //Tap Gesture
    func didTap()

    //Long Press Gesture
    func didLongPress()
    
    //Pinch Gesture
    func didPinch(gesture: UIPinchGestureRecognizer)
    
}

//We want implement zooming on our image view.
//So we use Interection protocol
//But as that protocol also requires to implement two other gesture so we implement them to meet the requirment but its a voilation of ISP.
//For solution see ImageInteractionISP.swift

class ImageZoomInteration: Interaction {
    var view: UIView
    
    init(with imageView: UIImageView) {
        view = imageView
        addPinchGesture()
    }
    
    // Zooming on image using pinch gesture
    //Interaction Protocol
    
    private func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(gesture:)))
        view.addGestureRecognizer(pinch)
    }
    
    func didPinch(gesture: UIPinchGestureRecognizer) {
        let imageView = view as! UIImageView
        if let image = imageView.image {
            imageView.image = UIImage.scale(image: image, by: gesture.scale)
            gesture.scale = 1.0
        }
    }
    
    //Method to handle pinch gesture
    @objc private func handlePinch(gesture: UIPinchGestureRecognizer) {
        self.didPinch(gesture: gesture)
    }
    
    // Force to implement other gestures
    func addTapGesture(gesture: UITapGestureRecognizer) {}
    func didTap() {}
    func addLongPressGesture(gesture: UILongPressGestureRecognizer) {}
    func didLongPress() {}
}




