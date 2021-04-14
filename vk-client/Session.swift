//
//  Session.swift
//  vk-client
//
//  Created by i.vasilyev on 23.03.2021.
//

import Foundation

//lesson 1
class Session {
    var token: String = ""
    var userId: String = ""
    var clientId: String = ""
    private init(){}
    
    static let instanse = Session()
    
}
