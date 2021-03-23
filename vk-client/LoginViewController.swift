//
//  ViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 11.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: properties
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var buttonLogin: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var vkImage: UIImageView!
    @IBOutlet var loadIndikator: UIView!
    
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonLogin.backgroundColor = .clear
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.layer.borderWidth = 1
       // buttonLogin.layer.backgroundColor = UIColor.black.cgColor
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        loadIndikator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000)) { [self] in
            checkLoginPass()
        }
    }
    
    func checkLoginPass() {
        if loginTextField.text == "" && passwordTextField.text == "" {
            self.performSegue(withIdentifier: "MainScreenPresentationSegue", sender: self)
        }else{
            print("Auth failed")
        }
    }
    
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        loginTextField.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordTextField.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseOut,
                       animations: {
                           self.loginTextField.transform = .identity
                           self.passwordTextField.transform = .identity
                       },
                       completion: nil)
    }
    
    func animateTitleAppearing() {
        self.vkImage.transform = CGAffineTransform(translationX: 0,
                                                     y: -self.view.bounds.height/2)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                           self.vkImage.transform = .identity
                       },
                       completion: nil)
    }
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.buttonLogin.layer.add(animation, forKey: nil)
    }
    
    //MARK: Scroll viev
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTitlesAppearing()
        animateTitleAppearing()
        animateAuthButton()
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            
        }
}

