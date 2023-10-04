//
//  MealDetailsView.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 08.09.2023..
//

import UIKit

class MealDetailsView: UIView {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var mealCategoryLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var mealAreaLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var mealInstructionsTextView: UITextView!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var mealIngredientsTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        scrollView.isScrollEnabled = true
        
        nameLabel.text = "name".uppercased()
        nameLabel.sizeToFit()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.font = .systemFont(ofSize: 12)
        
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        mealNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        
        categoryLabel.text = "category".uppercased()
        categoryLabel.sizeToFit()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 10).isActive = true
        categoryLabel.font = .systemFont(ofSize: 12)
        
        mealCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        mealCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        mealCategoryLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5).isActive = true
        
        areaLabel.text = "area".uppercased()
        areaLabel.sizeToFit()
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        areaLabel.topAnchor.constraint(equalTo: mealCategoryLabel.bottomAnchor, constant: 10).isActive = true
        areaLabel.font = .systemFont(ofSize: 12)
        
        mealAreaLabel.translatesAutoresizingMaskIntoConstraints = false
        mealAreaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        mealAreaLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 5).isActive = true
        
        instructionsLabel.text = "instructions".uppercased()
        instructionsLabel.sizeToFit()
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        instructionsLabel.topAnchor.constraint(equalTo: mealAreaLabel.bottomAnchor, constant: 10).isActive = true
        instructionsLabel.font = .systemFont(ofSize: 12)
        
        mealInstructionsTextView.translatesAutoresizingMaskIntoConstraints = false
        mealInstructionsTextView.isScrollEnabled = false
        mealInstructionsTextView.isEditable = false
        mealInstructionsTextView.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor).isActive = true
        mealInstructionsTextView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        
        ingredientsLabel.text = "ingredients".uppercased()
        ingredientsLabel.sizeToFit()
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        ingredientsLabel.topAnchor.constraint(equalTo: mealInstructionsTextView.bottomAnchor, constant: 10).isActive = true
        ingredientsLabel.font = .systemFont(ofSize: 12)
        
        mealIngredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        mealIngredientsTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 5).isActive = true
    }
}
