//
//  NetworkService.swift
//  vk-client
//
//  Created by i.vasilyev on 22.03.2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    func getRequest(parameters: Parameters, vkMethod: String)  {

        AF.request("https://api.vk.com/method/" + vkMethod,
                                method: .get,
                                parameters: parameters).responseJSON {
                                    response in  print(response.value ?? "")
                                    
                                }
        
    }
}
