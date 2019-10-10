//
//  ViewController.swift
//  RockTheBoat
//
//  Created by Jiangyong Xu on 10/8/19.
//  Copyright © 2019 Jiangyong Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var photoW: NSLayoutConstraint!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var alphButton: UIButton!
    @IBOutlet weak var stackbutton: UIButton!
    @IBOutlet weak var nestBUtton: UIButton!
    @IBOutlet weak var constraintButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.alpha = 0
        alphButton.setTitle(NSLocalizedString("alpha", comment: ""), for: .normal)
        photoLabel.text = NSLocalizedString("photo", comment: "")
        stackbutton.setTitle(NSLocalizedString("stack", comment: ""), for: .normal)
        nestBUtton.setTitle(NSLocalizedString("nested", comment: ""), for: .normal)
        constraintButton.setTitle(NSLocalizedString("constraint", comment: ""), for: .normal)
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
        constraint1(false)
        constraint1(true)
    }
    
    
    @IBAction func nestAnim(_ sender: Any) {
        rotate()
    }
    
    @IBAction func constraint(_ sender: Any) {
        UIView.animate(withDuration: 1.5, animations: {
            self.photoW.constant += -50.0
            self.view.layoutIfNeeded()
        })
    }
    
}

