//
//  VehicleCell.swift
//  eSpark
//
//  Created by Arvydas Klimavicius on 2020-10-11.
//

import UIKit

class VehicleCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberPlateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .cyan
        // Initialization code
    }

    func configureCell(with vehicle: VehicleModel) {
        titleLabel.text = vehicle.vehicleModel
        numberPlateLabel.text = vehicle.plateNumber
    }

}
