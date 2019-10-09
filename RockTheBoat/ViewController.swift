//
//  ViewController.swift
//  RockTheBoat
//
//  Created by Jiangyong Xu on 10/8/19.
//  Copyright © 2019 Jiangyong Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func imageFadein(){
        UIImageView.animate(withDuration: 1) {
            self.image.alpha = 100
        }
    }
    
    func constraint1(_ show: Bool) {
        let newYPosition = show ? self.view.frame.height : -self.view.frame.height
        let delay = show ? 0.5 : 0.0
        UIView.animate(withDuration: 1.2, delay: delay, options: [.curveEaseInOut], animations: { self.stackViewBottomConstraint.constant += newYPosition
            self.view.layoutIfNeeded()
        })
        
    }
    
    func rotate(){
        let angle =  CGFloat(Double.pi/2)
        let tr = CGAffineTransform.identity.rotated(by: angle)
        
        UIImageView.animate(withDuration: 0.7, animations: {
            self.image.transform = tr
        }, completion: { _ in
            UIImageView.animate(withDuration: 0.5, animations: {
                self.image.transform = CGAffineTransform.identity.rotated(by: angle*2)
            }, completion: { _ in
                UIImageView.animate(withDuration: 0.5, animations: {
                    self.image.transform = CGAffineTransform.identity.rotated(by: angle*4)
                })
            })
        })
    }
    
    @IBAction func alphaChange(_ sender: Any) {
        imageFadein()
    }
    
    
    @IBAction func stackAnim(_ sender: Any) {
        
    }
    
    
}

