//
//  MealDetailHeaderTableViewCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/9/23.
//

import UIKit
import Kingfisher

class MealDetailHeaderTableViewCell: UITableViewCell {

    //MARK: - IBoutlets
    
    @IBOutlet private weak var mealTitleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var areaLabel: UILabel!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    
    //MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWith(meal: Meal) {
        mealTitleLabel.text = meal.meal
        
        let url = URL(string: meal.thumbnail)
        thumbnailImageView.kf.setImage(with: url)
        
        if let category = meal.category {
            categoryLabel.isHidden = false
            categoryLabel.text = category
        } else {
            categoryLabel.isHidden = true
        }
        
        if let area = meal.area {
            areaLabel.isHidden = false
            areaLabel.text = area
        } else {
            areaLabel.isHidden = true
        }
    }
    
}
