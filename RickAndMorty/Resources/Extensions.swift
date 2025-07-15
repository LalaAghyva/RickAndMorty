//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Lala on 24.03.25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
