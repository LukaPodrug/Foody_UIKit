//
//  MealCell.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import UIKit

class MealCell: UICollectionViewCell {
    @IBOutlet var mealNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selfCustomization()
        
        mealNameLabelCustomization()
    }
    
    func selfCustomization() {
        self.layer.cornerRadius = Constants.shared.mealCellCornerRadius
    }
    
    func mealNameLabelCustomization() {
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mealNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.shared.mealCellNameLabelTopAnchorConstraint).isActive = true
        
        mealNameLabel.textAlignment = .center
        mealNameLabel.font = .systemFont(ofSize: Constants.shared.mealCellNameLabelFontSize)
        
        mealNameLabel.layer.cornerRadius = Constants.shared.mealCellNameLabelCornerRadius
        mealNameLabel.clipsToBounds = true
        mealNameLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        mealNameLabel.backgroundColor = .white
    }
}
