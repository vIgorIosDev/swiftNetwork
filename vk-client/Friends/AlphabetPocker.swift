//
//  AlphabetPicker.swift
//  vk-client
//
//  Created by i.vasilyev on 02.03.2021.
//

import UIKit

class AlphabetPocker {
    
    let allValues:[Character] = []
    var selectedValue: Character?

    @IBOutlet var stackViev: UIStackView!

    private func setupSubvievs() {
        let label = UILabel()
        label.text = String(selectedValue!)
    }
}


