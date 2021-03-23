//
//  FriendListLetter.swift
//  vk-client
//
//  Created by i.vasilyev on 03.03.2021.
//

import UIKit

class FriendListLetter: UITableViewHeaderFooterView {

    static let reuseUIdentifier = "FriendListLetter"
    
    let headerTitle = UILabel()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupSubvievs()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setupSubvievs()
        setupConstraints()
    }
    
    private func setupSubvievs() {
        self.addSubview(headerTitle)
      //  headerTitle.textAlignment = .center
        headerTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        backgroundView = UIView()
        //Он должен содержать первую букву фамилии и иметь полупрозрачный цвет фона, цвет которого совпадает с цветом таблицы.
        backgroundView?.backgroundColor = self.backgroundColor?.withAlphaComponent(0.5)
    }
   
    private func setupConstraints() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        let xOffset: CGFloat = 20
        let yOffset: CGFloat = 12
        headerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: xOffset).isActive = true
        headerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: xOffset).isActive = true
        headerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: -yOffset).isActive = true
        headerTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: yOffset).isActive = true
    }
}
