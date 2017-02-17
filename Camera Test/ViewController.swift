//
//  ViewController.swift
//  Camera Test
//
//  Created by Matt Coelho on 2/14/17.
//  Copyright © 2017 Matt Coelho. All rights reserved.
//

import UIKit
import SwiftyCam

var capturedImage: UIImage!

class ViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.switchCamera(notification:)), name: NSNotification.Name(rawValue: "switchCamera"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.capture(notification:)), name: NSNotification.Name(rawValue: "capture"), object: nil)
        tapToFocus = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFocusAtPoint point: CGPoint) {
        print ("party \(point)")
        let focusSquare = CameraFocusSquare(touchPoint: point)
        view.addSubview(focusSquare)
        //focusSquare?.setNeedsDisplay()
        
        
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        capturedImage = photo
        print("captured photo stored")
        
    }
    
    func capture(notification: NSNotification) {
        takePhoto()
        print("photo taken")
        
    }
    func switchCamera(notification: NSNotification) {
        switchCamera()
        
    }
    

    


}

