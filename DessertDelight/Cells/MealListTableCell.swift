//
//  MealListTableCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/28/23.
//

import UIKit
import Kingfisher

final class MealListTableCell: UITableViewCell {
    
    private var mealTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "First Label"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private var mealThumbnailImage: UIImageView = {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.layer.cornerRadius = 5
        return thumbnailImageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layoutCellViews()
    }
    
    private func layoutCellViews() {
        contentView.addSubview(mealThumbnailImage)
        contentView.addSubview(mealTitleLabel)
        
        NSLayoutConstraint.activate([
            mealThumbnailImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mealThumbnailImage.widthAnchor.constraint(equalToConstant: 40.0),
            mealThumbnailImage.heightAnchor.constraint(equalTo: mealThumbnailImage.widthAnchor, multiplier: 1),
            mealThumbnailImage.centerYAnchor.constraint(equalTo: mealTitleLabel.centerYAnchor),
            mealThumbnailImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            contentView.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: mealThumbnailImage.bottomAnchor, constant: 10),
            
            mealTitleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            mealTitleLabel.leadingAnchor.constraint(equalTo: mealThumbnailImage.trailingAnchor, constant: 10),
            mealTitleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            contentView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: mealTitleLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureWith(meal: Meal) {
        self.mealTitleLabel.text = meal.meal
        
        let thumbnailURL = URL(string: meal.thumbnail)
        self.mealThumbnailImage.kf.setImage(with: thumbnailURL)
    }
}
