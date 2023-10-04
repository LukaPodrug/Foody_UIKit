//
//  MenuCell.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import UIKit

class MenuCell: UICollectionViewCell {
    @IBOutlet var menuItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuItemLabelCustomization()
        
        selfCustomization()
    }
    
    func selfCustomization() {
        self.layer.cornerRadius = Constants.shared.menuCellCornerRadius
    }
    
    func menuItemLabelCustomization() {
        menuItemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuItemLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.shared.menuCellItemLabelLeadingAnchorConstraint).isActive = true
        menuItemLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.shared.menuCellItemLabelTrailingAnchorConstraint).isActive = true
        menuItemLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.shared.menuCellItemLabelTopAnchorConstraint).isActive = true
        menuItemLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.shared.menuCellItemLabelBottomAnchorConstraint).isActive = true
        
        menuItemLabel.font = .boldSystemFont(ofSize: Constants.shared.menuCellItemLabelFontSize)
        menuItemLabel.textAlignment = .center
    }
}
