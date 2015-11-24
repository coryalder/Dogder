//
//  ViewController.swift
//  Dogder
//
//  Created by Cory Alder on 2015-11-24.
//  Copyright © 2015 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var pics = ["pic1", "pic2", "pic3", "pic4"]
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nopeButtonAction(sender: AnyObject) {
        
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: [], animations: {
            
                self.imageView.transform = CGAffineTransformMakeRotation(0.12)
            
            }, completion: { done in
                print("nope animation half done")
                
                
                UIView.animateWithDuration(0.25, delay: 0.0, options: [], animations: {
                    
                    self.imageView.transform = CGAffineTransformIdentity
                    
                    
                    }, completion: { done in
                        print("nope animation all done")
                        
                        self.imageView.image = self.nextImage()
                })
        
        })
        
        
        
    }
    
    
    @IBAction func yupButtonAction(sender: AnyObject) {
    
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0.0, options: [], animations: { () -> Void in
            
            let home = self.imageView.center.y
            
            
            UIView.addKeyframeWithRelativeStartTime(0.2, relativeDuration: 0.3) {
                self.imageView.center.y = home - 20
            }
            
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.3) {
                self.imageView.center.y = home + 20
            }
            
            UIView.addKeyframeWithRelativeStartTime(0.8, relativeDuration: 0.5) {
                self.imageView.center.y = home
            }
            
            
            }) { (done) -> Void in
                
                print("yup animation done")
                
        }
        
        
        
        self.imageView.image = nextImage()
        
        
        
    
    }
 
    @IBAction func blockButtonAction(sender: AnyObject) {
        
        UIView.transitionWithView(self.imageView, duration: 0.5, options: [.TransitionCurlUp], animations: {
            
                self.imageView.image = self.nextImage()
            
            }, completion: { done in
        
                print("block animation done")
        })
        
    }
    
    func nextImage() -> UIImage {
        let next = pics.removeFirst()
        pics.append(next)
        return UIImage(named: "\(next).jpeg")!
    }
    

}

