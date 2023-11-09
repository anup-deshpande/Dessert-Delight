//
//  MeasurementsTableViewCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/9/23.
//

import UIKit

class MeasurementsTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    
    //MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(shouldShowTitle: Bool = false, measurement: (String, String)) {
        ingredientsTitleLabel.isHidden = !shouldShowTitle
        ingredientLabel.text = measurement.0
        measurementLabel.text = measurement.1
    }
    
}
