//
//  FriendCell.swift
//  vk-client
//
//  Created by i.vasilyev on 19.02.2021.
//

import UIKit


class FriendCell: UITableViewCell {

    @IBOutlet var friendLable:UILabel!    
    @IBOutlet var friendAvatar: UIImageView!    
    @IBOutlet var friendCirckleViev: CircleViev!
    

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        friendAvatar.layer.cornerRadius = friendAvatar.frame.width / 2
        friendAvatar.layer.borderWidth = 1
        friendAvatar.layer.masksToBounds = true
        friendAvatar.layer.borderColor = UIColor.white.cgColor
        friendAvatar.clipsToBounds = true
      
        friendCirckleViev.layer.shadowColor = UIColor.black.cgColor
        friendCirckleViev.layer.shadowOpacity = 0.5
        friendCirckleViev.layer.shadowRadius = 5
        friendCirckleViev.layer.shadowOffset = CGSize.zero
        friendCirckleViev.layer.cornerRadius = friendCirckleViev.frame.width / 2
    }
    
    

    
}



