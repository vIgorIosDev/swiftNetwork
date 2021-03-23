//
//  BigPhotoViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 16.03.2021.
//

import UIKit

class BigPhotoViewController: UIViewController {

    @IBOutlet var currentImageView: UIImageView!
    @IBOutlet var nextAppearingImageView: UIImageView!
    
    private var displayedImages: [UIImage] = [
        UIImage(named: "news_1")!,
        UIImage(named: "news_2")!,
        UIImage(named: "news_3")!,
        UIImage(named: "barbos11")!,
        UIImage(named: "barbos12")!,
    ]
    
    private var currentPhotoIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //currentImageView.image = displayedImages[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageSwipedRight(_ sender: UISwipeGestureRecognizer) {
        
        
        guard currentPhotoIndex > 0 else {return}
        
        let newPhotoIndex = currentPhotoIndex - 1
        let newPhoto = displayedImages[newPhotoIndex]
        
        nextAppearingImageView.image = newPhoto
        nextAppearingImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        
       

        UIView.animate(withDuration: 1) {
            self.currentImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 1) {[self] in
                currentImageView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                nextAppearingImageView.transform = .identity
            } completion: {[self] _ in
                currentImageView.image = newPhoto
                currentImageView.transform = .identity
                nextAppearingImageView.transform =   .identity
                currentPhotoIndex = newPhotoIndex
            }
        }
    }
    
    @IBAction func imageSwipedLeft(_ sender: UISwipeGestureRecognizer) {
        
        guard currentPhotoIndex <  displayedImages.count - 1 else {return}
        
        let newPhotoIndex = currentPhotoIndex + 1
        let newPhoto = displayedImages[newPhotoIndex]
        
        nextAppearingImageView.image = newPhoto
        nextAppearingImageView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        
        UIView.animate(withDuration: 1) {
            self.currentImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 1) {[self] in
                currentImageView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
                nextAppearingImageView.transform = .identity
            } completion: {[self] _ in
                currentImageView.image = newPhoto
                currentImageView.transform = .identity
                nextAppearingImageView.transform =   .identity
                currentPhotoIndex = newPhotoIndex
            }
        }
        
    }



}
