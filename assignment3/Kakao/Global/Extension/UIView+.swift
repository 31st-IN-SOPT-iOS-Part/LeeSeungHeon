//
//  UIView+.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
