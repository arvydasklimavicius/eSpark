//
//  VehiclesApi.swift
//  eSpark
//
//  Created by Arvydas Klimavicius on 2020-10-11.
//

import Foundation

protocol VehicleApiDelegate {
    func updateVehicles(_ vehiclesApi: VehiclesApi, vehicle: VehicleModel)
    func didFailWithError(error: Error)
}

struct VehiclesApi {
    var delegate: VehicleApiDelegate?
    
    
    func performRequest() {
        let session = URLSession.shared
        let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars")!
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data {
                if let car = self.parseJSON(safeData) {
                    self.delegate?.updateVehicles(self, vehicle: car)
                }
            }
        }
        
        task.resume()
    }
    
    
    func parseJSON(_ vehiclesData: Data) -> VehicleModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([VehicleData].self, from: vehiclesData)
            for car in decodedData {
                let numberPlate = car.plateNumber
                let name = car.model.title
                let address = car.location.address
                let photoUrl = car.model.photoUrl
                
                let dataModel = VehicleModel(vehicleModel: name, plateNumber: numberPlate, imageUrl: photoUrl, address: address)
                print(dataModel)
                return dataModel
                
            }
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
            
        }
        return VehicleModel()
        
    }

}
