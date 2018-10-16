//
//  ServiceHandler.swift
//  Practice_Ques_Ans
//
//  Created by Sebastin on 10/15/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import Foundation


class serviceHandler {
    
    var method:String = "GET"
    var url:String = ""
    
    init(url:String, method:String) {
        self.url = url
        self.method = method
    }
    
    func callService(completion:@escaping(Response?)->Void){
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        let request = URLRequest(url: URL(string: self.url)!)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let responseData = data else{
                return
            }
            do{
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String:Any] else{
                    return
                }
                let response = Response.init(data: responseData)
                print(response?.climate as Any)
                print("data = ", data!, "response = ", response as Any, "json = ", json)
                completion(response)
                
            }catch{
                print("error")
            }
           
        }
        task.resume()
    }
   
    
   
}
