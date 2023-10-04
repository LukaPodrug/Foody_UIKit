//
//  UICollectionView.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 08.09.2023..
//

import Foundation
import UIKit

extension UICollectionView {
    func animatedReload() {
        UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: { self.reloadData() }, completion: nil)
    }
}
