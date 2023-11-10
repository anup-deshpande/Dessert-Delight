//
//  MealListTableViewCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/7/23.
//

import UIKit
import Kingfisher

class MealListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets

    @IBOutlet private weak var mealThumbnailImage: UIImageView!
    @IBOutlet private weak var mealTitleLabel: UILabel!
    
    //MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func setMeal(meal: Meal) {
        self.mealTitleLabel.text = meal.meal
        
        let thumbnailURL = URL(string: meal.thumbnail)
        self.mealThumbnailImage.kf.setImage(with: thumbnailURL)
    }
    
}
