//
//  CameraViewController.swift
//  Camera Test
//
//  Created by Matt Coelho on 2/14/17.
//  Copyright © 2017 Matt Coelho. All rights reserved.
//

import UIKit
import SwiftyCam

class CameraViewController: UIViewController {

    @IBOutlet weak var captureButton: SwiftyCamButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
        
    }
    @IBAction func didPressCapture(_ sender: Any) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "capture"), object: nil)
        performSegue(withIdentifier: "toImageController", sender: nil)
        //Setup call to function
        
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
