//
//  ViewController.swift
//  DSSkeleton
//
//  Created by indianic on 23/08/18.
//  Copyright © 2018 indianic. All rights reserved.
//

import UIKit

class animationViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQoute: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startViewAnimation()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startViewAnimation()  {
        imgProfile.startDSLoading()
        lblName.startDSLoading()
        lblQoute.startDSLoading()
        lblAuthor.startDSLoading()
    }
    
    @objc func stopViewAnimation() {
        imgProfile.image = #imageLiteral(resourceName: "jhonDoe.png")
        imgProfile.stopDSLoading()

        lblName.text = "Darshit Shah"
        lblName.stopDSLoading()
        
        lblQoute.text = "I've learned that you shouldn't go through life with a catcher's mitt on both hands; you need to be able to throw something back."
         lblQoute.stopDSLoading()
        
        lblAuthor.text = "- Maya Angelou"
        lblAuthor.stopDSLoading()
    }
    
    
    @IBAction func loadingClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.setTitle(sender.isSelected ? "START LOADING" : "STOP LOADING" , for: .normal)
        if sender.isSelected {
            stopViewAnimation()
        }
        else{
            startViewAnimation()
        }
        
    }
    
    
    
}

extension UIView {
    func startDSLoading() {
        let gradient = CAGradientLayer()

        gradient.frame = self.bounds
        gradient.colors = [UIColor.gray.cgColor, UIColor.lightGray.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0.0, 0.25, 0.75, 1.0]
        gradient.drawsAsynchronously = true
        self.layer.insertSublayer(gradient, at: 0)

        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 2.0
        gradientChangeAnimation.toValue = [UIColor.gray.cgColor, UIColor.lightGray.cgColor, UIColor.white.cgColor]
        gradientChangeAnimation.fromValue = [UIColor.white.cgColor, UIColor.lightGray.cgColor, UIColor.gray.cgColor]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.repeatCount = .infinity
        gradientChangeAnimation.autoreverses = true
        gradient.add(gradientChangeAnimation, forKey: "colorChange")

        self.alpha = 0.5
    }

    func stopDSLoading() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1.0
            self.layer.sublayers?.removeAll()
        }
    }
}

