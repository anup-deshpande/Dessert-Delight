//
//  MealInstructionsTableViewCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/9/23.
//

import UIKit

class MealInstructionsTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet private weak var instructionTextView: UITextView!
    
    //MARK: - Override

    override func awakeFromNib() {
        super.awakeFromNib()
        instructionTextView.textContainerInset = .zero
    }

    func configureWith(meal: Meal) {
        guard let instructions = meal.instructions else { return }
        
        instructionTextView.text = instructions
    }
    
}
