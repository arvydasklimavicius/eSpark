//
//  ViewController.swift
//  eSpark
//
//  Created by Arvydas Klimavicius on 2020-10-10.
//

import UIKit

class ViewController: UIViewController, VehicleApiDelegate {
    

    var dataApi = VehiclesApi()
    var dataFeed = [VehicleModel]()


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataApi.delegate = self
        
        
        
        
    }
    func updateVehicles(_ vehiclesApi: VehiclesApi, vehicle: VehicleModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell", for: indexPath)
        if let vehicleCell = cell as? VehicleCell {
            let vehicle = dataFeed[indexPath.row]
            vehicleCell.configureCell(with: vehicle)
            
        }
        return cell
        
    }
    
}


//    func setupDataFeed() {
//        dataApi.networking { [weak self] feed in
//            self?.dataFeed = feed
//            print(feed.self)
//        }
//        dataApi.networking()
//    }
    
//    func networking(completion: @escaping (AvailableVehicles) -> ()) {
//        let session = URLSession.shared
//        let url = URL(string: "https://development.espark.lt/api/mobile/public/availablecars")!
//        let task = session.dataTask(with: url) { (data, response, error) in
//
//            guard let data = data else {
//                completion(AvailableVehicles(results: []))
//                return
//            }
//            if let jsonData = try? JSONDecoder().decode(AvailableVehicles.self, from: data) {
//                completion(jsonData)
//            } else {
//                completion(AvailableVehicles(results: []))
//            }
//        }
//        task.resume()
//
//    }
//
    

