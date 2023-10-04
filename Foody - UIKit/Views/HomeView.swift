//
//  HomeView.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import UIKit

class HomeView: UIView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var categoryMenuCollectionView: UICollectionView!
    @IBOutlet var categoryMealCollectionView: UICollectionView!
    @IBOutlet var areaMenuCollectionView: UICollectionView!
    @IBOutlet var areaMealCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabelCustomization()
        
        categoryMenuCollectionViewCustomization()
        
        areaMenuCollectionViewCustomization()
        
        categoryMealCollectionViewCustomization()
        
        areaMealCollectionViewCustomization()
    }
    
    func titleLabelCustomization() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.shared.homePageTitleLeadingAnchorConstraint).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.shared.statusBarHeight).isActive = true
        
        titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: Constants.shared.homePageTitleLabelFontSize).isActive = true
        
        titleLabel.text = "Foody"
        
        titleLabel.font = .boldSystemFont(ofSize: Constants.shared.homePageTitleLabelFontSize)
    }
    
    func categoryMenuCollectionViewCustomization() {
        categoryMenuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        categoryMenuCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.shared.menuCollectionTopAnchorConstraint).isActive = true
        
        categoryMenuCollectionView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        categoryMenuCollectionView.heightAnchor.constraint(equalToConstant: Constants.shared.menuCellItemLabelFontSize + abs(Constants.shared.menuCellItemLabelTopAnchorConstraint) + abs(Constants.shared.menuCellItemLabelBottomAnchorConstraint) + Constants.shared.menuCellItemLabelDifference).isActive = true
        
        (categoryMenuCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        categoryMenuCollectionView.showsHorizontalScrollIndicator = false
        
        categoryMenuCollectionView.contentInset = UIEdgeInsets(top: 0, left: Constants.shared.menuCollectionViewLeftInset, bottom: 0, right: Constants.shared.menuCollectionViewRightInset)
    }
    
    func areaMenuCollectionViewCustomization() {
        areaMenuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        areaMenuCollectionView.topAnchor.constraint(equalTo: categoryMealCollectionView.bottomAnchor, constant: Constants.shared.menuCollectionTopAnchorConstraint).isActive = true
        
        areaMenuCollectionView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        areaMenuCollectionView.heightAnchor.constraint(equalToConstant: Constants.shared.menuCellItemLabelFontSize + abs(Constants.shared.menuCellItemLabelTopAnchorConstraint) + abs(Constants.shared.menuCellItemLabelBottomAnchorConstraint) + Constants.shared.menuCellItemLabelDifference).isActive = true
        
        (areaMenuCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        areaMenuCollectionView.showsHorizontalScrollIndicator = false
        
        areaMenuCollectionView.contentInset = UIEdgeInsets(top: 0, left: Constants.shared.menuCollectionViewLeftInset, bottom: 0, right: Constants.shared.menuCollectionViewRightInset)
    }
    
    func categoryMealCollectionViewCustomization() {
        categoryMealCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        categoryMealCollectionView.topAnchor.constraint(equalTo: categoryMenuCollectionView.bottomAnchor, constant: Constants.shared.mealCollectionTopAnchorConstraint).isActive = true
        
        categoryMealCollectionView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        categoryMealCollectionView.heightAnchor.constraint(equalToConstant: (self.frame.height - Constants.shared.statusBarHeight - titleLabel.frame.height - Constants.shared.menuCollectionTopAnchorConstraint -  categoryMenuCollectionView.frame.height - Constants.shared.menuCollectionTopAnchorConstraint - areaMenuCollectionView.frame.height) / 2).isActive = true
        
        (categoryMealCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        categoryMealCollectionView.showsHorizontalScrollIndicator = false
        
        categoryMealCollectionView.contentInset = UIEdgeInsets(top: 0, left: Constants.shared.mealCollectionViewLeftInset, bottom: 0, right: Constants.shared.mealCollectionViewRightInset)
    }
    
    func areaMealCollectionViewCustomization() {
        areaMealCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        areaMealCollectionView.topAnchor.constraint(equalTo: areaMenuCollectionView.bottomAnchor,  constant: Constants.shared.mealCollectionTopAnchorConstraint).isActive = true
        
        areaMealCollectionView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        areaMealCollectionView.heightAnchor.constraint(equalToConstant: (self.frame.height - Constants.shared.statusBarHeight - titleLabel.frame.height - Constants.shared.menuCollectionTopAnchorConstraint -  categoryMenuCollectionView.frame.height - Constants.shared.menuCollectionTopAnchorConstraint - areaMenuCollectionView.frame.height) / 2).isActive = true
        
        (areaMealCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
        areaMealCollectionView.showsHorizontalScrollIndicator = false
        
        areaMealCollectionView.contentInset = UIEdgeInsets(top: 0, left: Constants.shared.mealCollectionViewLeftInset, bottom: 0, right: Constants.shared.mealCollectionViewRightInset)
    }
}
