//
//  CarApi.swift
//  eSpark
//
//  Created by Arvydas Klimavicius on 2020-10-10.
//

import Foundation

class DataApi {
    
    func networking() {
        let session = URLSession.shared
        let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil || data == nil {
                    print("Client error!")
                    return
                }

                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
        }
        task.resume()
        
    }
        
}
