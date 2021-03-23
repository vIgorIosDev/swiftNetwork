//
//  VKLoginController.swift
//  vk-client
//
//  Created by i.vasilyev on 22.03.2021.
//

import UIKit
import WebKit
import Alamofire

class VKLoginController: UIViewController {
    
    let service = NetworkService()
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Session.instanse.clientId),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    //9. Получение групп по поисковому запросу;
    func searchGroup(searchString: String)  {
        let parameters: Parameters = [
            "q": searchString,
            "offset": "1",
            "count":"10",
            "v":"5.130",
            "access_token":Session.instanse.token
        ]
        
        service.getRequest(parameters: parameters, vkMethod: "groups.search")
    }
    
    //6. Получение списка друзей;
    func getFriendsList()  {
        let parameters: Parameters = [
            "user_id": Session.instanse.userId,
            "order": "name",
            "fields":"nickname",
            "v":"5.130",
            "access_token":Session.instanse.token
        ]
        service.getRequest(parameters: parameters, vkMethod: "friends.get")
        
    }
    
    //7. Получение фотографий человека;
    func getPhotoByUserId(owner_id:String)  {
        let parameters: Parameters = [
            "owner_id": owner_id,
            "extended":"1",
            "v":"5.130",
            "access_token":Session.instanse.token
        ]
        service.getRequest(parameters: parameters, vkMethod: "photos.getAll")
        
    }
    
    //8. Получение групп текущего пользователя;
    func getGroupsList()  {
        let parameters: Parameters = [
            "user_id": Session.instanse.userId,
            "extended":"1",
            "fields":"name",
            "v":"5.130",
            "access_token":Session.instanse.token
        ]
        service.getRequest(parameters: parameters, vkMethod: "groups.get")
        
    }
    
}



extension VKLoginController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        Session.instanse.token = params["access_token"]!
        getFriendsList()
        getGroupsList()
        getPhotoByUserId(owner_id:"797819")
        searchGroup(searchString: "Music")
        
       
        decisionHandler(.cancel)
    }
}
