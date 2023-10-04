//
//  UILabel.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 07.09.2023..
//

import Foundation
import UIKit

extension UILabel {
    func calculateWidth(text: String, font: UIFont) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        
        label.text = text
        label.font = font
        label.sizeToFit()
        
        return label.frame.size
    }
}
