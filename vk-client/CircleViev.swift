//
//  CircleViev.swift
//  vk-client
//
//  Created by i.vasilyev on 25.02.2021.
//

import UIKit



class CircleViev: UIView {
    
    @IBOutlet var friendAvatarImage: UIImageView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGestureDetected))
        self.addGestureRecognizer(tapGesture)
    }
  
    @objc func tapGestureDetected(_ gesture: UITapGestureRecognizer) {
    
        self.friendAvatarImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

            UIView.animate(withDuration: 1,
                           delay: 0.1,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                               self.friendAvatarImage.transform = .identity
                           },
                           completion: nil)
        }
  
    

  
}

