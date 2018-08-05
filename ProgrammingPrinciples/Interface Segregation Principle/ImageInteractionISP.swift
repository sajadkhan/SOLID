//
//  ImageInteractionISP.swift
//  ProgrammingPrinciples
//
//  Created by Sajad on 8/5/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation

//This is refined version of ImageInteraction.swift, by following Interface Segregation Principle.

import UIKit

//Now we have separate interfaces for all interactions

protocol TapInteraction {
    //Tap Gesture
    func didTap()
}

protocol LongPressInteraction {
    //Long Press Gesture
    func didLongPress()
}

protocol PinchInteraction {
    //Pinch Gesture
    func didPinch(gesture: UIPinchGestureRecognizer)
}

//Some Interaction which handles tap, long and pinch.
/*
class SomeInteraction: TapInteraction, LongPressInteraction, PinchInteraction {
    // Implement all the requirements it is following
}
*/

//ImageZoomInteraction isn't force to implement the method it is not using.

class ImageZoomInteration: PinchInteraction {
    var view: UIView
    
    init(with imageView: UIImageView) {
        view = imageView
        addPinchGesture()
    }
    
    // Zooming on image using pinch gesture
    private func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(gesture:)))
        view.addGestureRecognizer(pinch)
    }
    
    //Method to handle pinch gesture
    @objc private func handlePinch(gesture: UIPinchGestureRecognizer) {
        self.didPinch(gesture: gesture)
    }
    
    //PinchInteraction Protocol
    
    func didPinch(gesture: UIPinchGestureRecognizer) {
        let imageView = view as! UIImageView
        if let image = imageView.image {
            imageView.image = UIImage.scale(image: image, by: gesture.scale)
            gesture.scale = 1.0
        }
    }
}





