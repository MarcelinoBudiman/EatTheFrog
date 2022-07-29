//
//  QuotesViewModel.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 27/07/22.
//

import Foundation
import QuoteKit

//class QuotesViewModel: ObservableObject{
//    @Published var quote: Quote?
//
//    let headers = [
//        "X-RapidAPI-Key": "SIGN-UP-FOR-KEY",
//        "X-RapidAPI-Host": "timshim-quotes-v1.p.rapidapi.com"
//    ]
//
//    let request = NSMutableURLRequest(url: NSURL(string: "https://timshim-quotes-v1.p.rapidapi.com/quotes")! as URL,
//                                            cachePolicy: .useProtocolCachePolicy,
//                                        timeoutInterval: 10.0)
//
//    self.request.httpMethod = "GET"
//    request.allHTTPHeaderFields = headers
//
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        if (error != nil) {
//            print(error)
//        } else {
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
//        }
//    })
//
//    dataTask.resume()
//}
