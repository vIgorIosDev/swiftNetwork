//
//  newsButtonLike.swift
//  vk-client
//
//  Created by i.vasilyev on 09.03.2021.
//

import UIKit

class newsButtonLike: UIView {

    @IBOutlet var newsImageLike: UIImageView?
    @IBOutlet var newsLikeCount: UILabel?
    var isLiked: Bool = false
    var currentCountLikes: Int = 0
   
    override  func awakeFromNib() {
        super.awakeFromNib()
        newsImageLike?.image = UIImage(named: "like")
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapGestureDetected))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureDetected(_ gesture: UITapGestureRecognizer) {
        isLiked.toggle()
        checkCount()
        if isLiked {
            refresh(currentCountLikes + 1)
        } else {
            refresh(currentCountLikes - 1)
        }
    }
    
    func checkCount() {
        
        let currentText: String = newsLikeCount?.text ?? "0"
        currentCountLikes = Int(currentText)!
        
    }
    
    func refresh(_ likeCount: Int) {
        if !isLiked {
            newsImageLike?.image = UIImage(named: "like")
        } else{
            newsImageLike?.image = UIImage(named: "liked")
        }
        
        newsLikeCount?.text = String(likeCount)
        
    }
    
    

}
