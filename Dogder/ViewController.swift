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
    
    var currentImageView: UIImageView?
    var newImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func nopeButtonAction(sender: AnyObject) {
        
        //self.imageView.image = nextImage()
        
    }
    
    
    @IBAction func yupButtonAction(sender: AnyObject) {
       // self.imageView.image = nextImage()
        
        self.newImageView = UIImageView()
        
        self.newImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.newImageView)
        
        
        let height = self.newImageView.heightAnchor.constraintEqualToConstant(120)
        height.active = true
        
        let width = self.newImageView.widthAnchor.constraintEqualToConstant(120)
        width.active = true
        
        self.newImageView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: 0).active = true
        
        let side = self.newImageView.trailingAnchor.constraintEqualToAnchor(self.view.leadingAnchor)
        side.active = true
        
        self.newImageView.image = self.nextImage()
        
        self.newImageView.layoutIfNeeded()
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            
            
            height.constant = 240
            width.constant = 240
            
            self.view.removeConstraint(side)
            
            self.newImageView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
            
            self.view.layoutIfNeeded()
            
            }, completion: { done in
        
                print ("springy yup animation done")
                
                if let old = self.currentImageView {
                    old.removeFromSuperview()
                }
                
                self.currentImageView = self.newImageView
                
                
                
        })
        
        
        
        
    
    }
 
    @IBAction func blockButtonAction(sender: AnyObject) {
        
//        UIView.transitionWithView(self.imageView, duration: 0.5, options: [.TransitionCurlUp], animations: {
//            
//                self.imageView.image = self.nextImage()
//            
//            }, completion: { done in
//        
//                print("block animation done")
//        })
        
    }
    
    func nextImage() -> UIImage {
        let next = pics.removeFirst()
        pics.append(next)
        return UIImage(named: "\(next).jpeg")!
    }
    

}

