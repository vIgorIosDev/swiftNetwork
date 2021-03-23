//
//  LikeButton.swift
//  vk-client
//
//  Created by i.vasilyev on 26.02.2021.
//

import UIKit

class LikeButton: UIView {
    @IBOutlet var friendImageLike: UIImageView!
    @IBOutlet var friendLikeCount: UILabel?
    var isLiked: Bool = false
    var currentCountLikes: Int = 0
   
    override  func awakeFromNib() {
        super.awakeFromNib()
        friendImageLike?.image = UIImage(named: "like")
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGestureDetected))
        self.addGestureRecognizer(tapGesture)
    }
    

    @objc func tapGestureDetected(_ gesture: UITapGestureRecognizer) {
        isLiked.toggle()
        if isLiked {
            refresh(currentCountLikes + 1)
        } else {
            refresh(currentCountLikes)
        } 
        self.friendImageLike.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        UIView.animate(withDuration: 1,
                           delay: 0.2,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: {
                               self.friendImageLike.transform = .identity
                           },
                           completion: nil)
    }
    
    func refresh(_ likeCount: Int) {
        if !isLiked {
            friendImageLike?.image = UIImage(named: "like")
        } else{
            friendImageLike?.image = UIImage(named: "liked")
        }
        
        friendLikeCount?.text = String(likeCount)
        
    }

}
