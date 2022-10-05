//
//  UIView+.swift
//  assignment1
//
//  Created by 이승헌 on 2022/10/05.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
