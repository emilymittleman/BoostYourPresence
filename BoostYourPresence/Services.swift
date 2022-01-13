//
//  Services.swift
//  BoostYourPresence
//
//  Created by Justin Holmes on 1/13/22.
//

import Foundation
import UIKit

class Services {
    
    func addOrder(link: String, quantity:String){
        // Prepare URL
        let url = URL(string: "https://boostyourpresence.org/api/v2")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        let key = "d4c2bb0c6d747b80d4fc4acdc03e9630"

        let action = "add"
        let service = "1092"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "key=\(key)&action=\(action)&service=\(service)&link=\(link)&quantity=\(quantity)";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
     
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
}
