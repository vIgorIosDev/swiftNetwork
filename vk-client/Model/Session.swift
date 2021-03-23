//
//  Session.swift
//  vk-client
//
//  Created by i.vasilyev on 22.03.2021.
//

import Foundation

class Session {
    var token: String = ""
    var userId: String = "80871506"
    var clientId: String = "7798070"
    private init(){}
    
    static let instanse = Session()
    
}
