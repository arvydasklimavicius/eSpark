////
////  CarApi.swift
////  eSpark
////
////  Created by Arvydas Klimavicius on 2020-10-10.
////
//
//import Foundation
//
//class DataApi {
//    
//    func networking() {
//        let session = URLSession.shared
//        let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars")!
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil || data == nil {
//                    print("Client error!")
//                    return
//                }
//
//                do {
////                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
////                    print(json)
//                    let decoder = JSONDecoder()
//                    let vehicles = try decoder.decode([VehicleData].self, from: data!)                
//                    for car in vehicles{
//                        let numberPlate = car.plateNumber
//                        let name = car.model.title
//                        let address = car.location.address
//                        let photoUrl = car.model.photoUrl
//                        
//                        let vehicleData = VehicleModel(vehicleModel: name, plateNumber: numberPlate, imageUrl: photoUrl, address: address)
//                        print(vehicleData)
//                        
//                    }
//                } catch {
//                    print("JSON error: \(error.localizedDescription)")
//                }
//        }
//        task.resume()
//
//    }
//    
//    
//        
//        func performRequest(with urlString: String) {
//
//            if let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars") {
//                
//
//                let session = URLSession(configuration: .default)
//                
//
//                let task = session.dataTask(with: url) { (data, response, error) in
//                    if error != nil {
//                        print("Error!")
//                        return
//                    }
//                    if let safeData = data {
//                        if let vehicle = self.parseJSON(safeData) {
////                            self.delegate?.didUpdateWeather(self, weather: weather)
//                        }
//                    }
//                }
//                
//
//                task.resume()
//            }
//        }
//
//        func parseJSON(_ vehicleData: Data) -> VehicleModel? {
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode([VehicleData].self, from: vehicleData)
//                for car in decodedData {
//                    let numberPlate = car.plateNumber
//                    let name = car.model.title
//                    let address = car.location.address
//                    let photoUrl = car.model.photoUrl
//                    
//                    let vehicleData = VehicleModel(vehicleModel: name, plateNumber: numberPlate, imageUrl: photoUrl, address: address)
//                    return vehicleData
//                    
//            } catch {
//                print("Error")
//                return nil
//
//            }
//        }
//        
//    
////    func networking(completion: @escaping (AvailableVehicles) -> ()) {
////        let session = URLSession.shared
////        let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars")!
////        let task = session.dataTask(with: url) { (data, response, error) in DispatchQueue.main.async {
////            guard let data = data else {
////                completion(AvailableVehicles(results: []))
////                return
////            }
////            if let jsonData = try? JSONDecoder().decode(AvailableVehicles.self, from: data) {
////                completion(jsonData)
////            } else {
////                completion(AvailableVehicles(results: []))
////            }
////        }
////
////        }
////        task.resume()
////
////    }
//    
//        
//}
