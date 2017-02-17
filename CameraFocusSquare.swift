//
//  CameraFocusSquare.swift
//  
//
//  Created by Matt Coelho on 2/14/17.
//
//

import UIKit

class CameraFocusSquare: UIView, CAAnimationDelegate {
    
    internal let kSelectionAnimation:String = "selectionAnimation"
    
    fileprivate var _animationGroup: CAAnimationGroup? = CAAnimationGroup()
    fileprivate var _selectionBlink: CABasicAnimation?
    fileprivate var _pulseAnimation: CABasicAnimation?
    
    convenience init(touchPoint: CGPoint) {
        self.init()
        self.updatePoint(touchPoint)
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.gray.cgColor
        initBlink()
        //initScale()
        self.animateFocusingAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    fileprivate func initBlink() {
        
        // create the blink animation
        self._selectionBlink = CABasicAnimation(keyPath: "borderColor")
        self._selectionBlink!.toValue = (UIColor.orange.cgColor as AnyObject)
        self._selectionBlink!.repeatCount = 3
        // number of blinks
        self._selectionBlink!.duration = 0.3
        // this is duration per blink
        //self._selectionBlink!.delegate = self
        self._pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        self._pulseAnimation!.duration = 0.1
        //self._pulseAnimation!.speed = 0.1
        self._pulseAnimation!.fromValue = 1
        self._pulseAnimation!.toValue = 0.9
        //pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self._pulseAnimation!.autoreverses = true
        self._pulseAnimation!.repeatCount = 0
        //self._pulseAnimation!.delegate = self
        self._animationGroup!.animations = [self._pulseAnimation!, self._selectionBlink!]
        //self._animationGroup!.repeatCount = 0
        self._animationGroup!.duration = 0.6
        self._animationGroup!.delegate = self
    }
/*
    fileprivate func initScale() {
        self._pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        self._pulseAnimation!.duration = 0.1
        //self._pulseAnimation!.speed = 0.1
        self._pulseAnimation!.fromValue = 1
        self._pulseAnimation!.toValue = 0.9
        //pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self._pulseAnimation!.autoreverses = true
        self._pulseAnimation!.repeatCount = 0
        self._pulseAnimation!.delegate = self
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Updates the location of the view based on the incoming touchPoint.
     */
    
    func updatePoint(_ touchPoint: CGPoint) {
        let squareWidth: CGFloat = 85
        let frame: CGRect = CGRect(x: touchPoint.x - squareWidth / 2, y: touchPoint.y - squareWidth / 2, width: squareWidth, height: squareWidth)
        self.frame = frame
    }
    /**
     This unhides the view and initiates the animation by adding it to the layer.
     */
    
    func animateFocusingAction() {
        
        if let blink = _animationGroup {
            // make the view visible
            self.alpha = 1.0
            self.isHidden = false
            // initiate the animation
            self.layer.add(blink, forKey: kSelectionAnimation)
        }

        
        
    }
    /**
     Hides the view after the animation stops. Since the animation is automatically removed, we don't need to do anything else here.
     */
    public func animationDidStop(_ anim: CAAnimationGroup, finished flag: Bool) {
        print("stop")
        self.alpha = 0.0
        self.isHidden = true
    }
    
   /* public func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if flag{
            // hide the view
            self.alpha = 0.0
            self.isHidden = true
        }
    }
 */
}
