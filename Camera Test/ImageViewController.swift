//
//  ImageViewController.swift
//  Camera Test
//
//  Created by Matt Coelho on 2/14/17.
//  Copyright © 2017 Matt Coelho. All rights reserved.
//

import UIKit
import Sharaku
import EasyTipView

class ImageViewController: UIViewController {
    
    var preferences = EasyTipView.Preferences()

    @IBOutlet weak var buttonB: UIButton!

    @IBOutlet weak var imagePreview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        /*
         * Optionally you can make these preferences global for all future EasyTipViews
         */
        EasyTipView.globalPreferences = preferences
        
        
        

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        imagePreview.image = capturedImage
        EasyTipView.show(forView: self.buttonB,
                         withinSuperview: self.navigationController?.view,
                         text: "Tip view inside the navigation controller's view. Tap to dismiss!",
                         preferences: preferences,
                         delegate: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {}) 
        //viewDidLoad()
       // let imageToBeFiltered = UIImage(named: "targetImage")
        /*
        
        let vc = SHViewController(image: capturedImage)
        //vc.delegate = self
        self.present(vc, animated:true, completion: nil)
         */
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


