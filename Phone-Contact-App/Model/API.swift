//
//  API.swift
//  Phone-Contact-App
//
//  Created by IOS on 10/10/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct API {
//    var myContacts = [ContactData]()
//
//    func APIcall() {
//        let contactURL = "https://randomuser.me/api/?results=20"
//        let request = NSMutableURLRequest(url: NSURL(string: contactURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//                    request.httpMethod = "GET"
//        let session = URLSession.shared
//        let task = session.dataTask(with: request as URLRequest, completionHandler: handle(data: response: error:))
//        task.resume()
//    }
//
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error ?? "")
//        }
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse ?? "")
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString ?? "")
//            self.parseJSON(contactData: safeData)
//        }
//    }
//
//    func parseJSON(contactData: Data)  {
//        let decoder = JSONDecoder()
//        do {
//            let decodeData = try decoder.decode(ContactData.self, from: contactData)
//            DispatchQueue.main.async {
//                print(decodeData.results[10].name.first)
//            }
//        } catch {
//            print(error)
//        }
//    }
}
