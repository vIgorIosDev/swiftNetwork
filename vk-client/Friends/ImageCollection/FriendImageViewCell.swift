//
//  FriendImageViewCell.swift
//  vk-client
//
//  Created by i.vasilyev on 22.02.2021.
//

import UIKit

class FriendImageViewCell: UICollectionViewCell {
    
    
    @IBOutlet var friendImage: UIImageView!    
    @IBOutlet var likeButtonViev: LikeButton!
    
  
    func configure(with userImages:UIImage,like likeCount:Int) {
        friendImage.image = userImages
        likeButtonViev.refresh(likeCount)
        likeButtonViev.currentCountLikes = likeCount
    }

}
