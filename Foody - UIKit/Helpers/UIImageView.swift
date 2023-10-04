//
//  UIIMage.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 07.09.2023..
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFromURL(url: URL) {
            DispatchQueue.global().async { [weak self] in
                guard let data = try? Data(contentsOf: url) else {
                    return
                }
                guard let image = UIImage(data: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
    }
}
