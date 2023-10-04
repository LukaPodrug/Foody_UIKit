//
//  Constants.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 06.09.2023..
//

import Foundation
import UIKit

class Constants {
    static let shared: Constants = Constants()
    
    let statusBarHeight: CGFloat = 60
    
    let homePageTitleLeadingAnchorConstraint: CGFloat = 15
    let homePageTitleLabelFontSize: CGFloat = 25
    
    let mealCollectionTopAnchorConstraint: CGFloat = 10
    let mealCollectionViewLeftInset: CGFloat = 10
    let mealCollectionViewRightInset: CGFloat = 10
    
    let mealCellReloadXOffset: CGFloat = -10
    let mealCellCornerRadius: CGFloat = 10
    
    let mealCellNameLabelTopAnchorConstraint: CGFloat = 20
    let mealCellNameLabelLeftInset: CGFloat = 10
    let mealCellNameLabelRightInset: CGFloat = 10
    let mealCellNameLabelTopInset: CGFloat = 10
    let mealCellNameLabelBottomInset: CGFloat = 10
    let mealCellNameLabelFontSize: CGFloat = 15
    let mealCellNameLabelCornerRadius: CGFloat = 10
    
    let mealCellBackgroundImageAlphaComponent: CGFloat = 0.2
    
    let menuCollectionTopAnchorConstraint: CGFloat = 10
    let menuCollectionViewLeftInset: CGFloat = 10
    let menuCollectionViewRightInset: CGFloat = 10
    
    let menuCellCornerRadius: CGFloat = 10
    
    let menuCellItemLabelLeadingAnchorConstraint: CGFloat = 10
    let menuCellItemLabelTrailingAnchorConstraint: CGFloat = -10
    let menuCellItemLabelTopAnchorConstraint: CGFloat = 10
    let menuCellItemLabelBottomAnchorConstraint: CGFloat = -10
    let menuCellItemLabelDifference: CGFloat = 4
    let menuCellItemLabelFontSize: CGFloat = 15
    
    init() {
        
    }
}
