//
//  LoadingIndicator.swift
//  vk-client
//
//  Created by i.vasilyev on 14.03.2021.
//

import UIKit

class LoadingIndicator: UIView {

    @IBOutlet var firstDot: UIImageView!
    @IBOutlet var secondDot: UIImageView!
    @IBOutlet var thirdDot: UIImageView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        UIView.animate(withDuration: 1,  delay: 0.3, options: [.repeat, .autoreverse], animations: {
            self.firstDot.alpha = 0
        })
        UIView.animate(withDuration: 1,  delay: 0.6, options: [.repeat, .autoreverse], animations: {
                self.secondDot.alpha = 0
        })
        UIView.animate(withDuration: 1,  delay: 0.9, options: [.repeat, .autoreverse], animations: {
                self.thirdDot.alpha = 0
        })
        
 
    }
    
}
