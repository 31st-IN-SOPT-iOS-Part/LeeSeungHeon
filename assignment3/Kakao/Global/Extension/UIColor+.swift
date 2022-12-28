//
//  UIColor+.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/18.
//

import UIKit

extension UIColor {
    
    // Auth
    @nonobjc class var loginGrayText: UIColor {
        return UIColor(red: 125/256, green: 126/256, blue: 125/256, alpha: 1.0)
    }
    
    @nonobjc class var authTextField: UIColor {
        return UIColor(red: 160/256, green: 159/256, blue: 160/256, alpha: 1.0)
    }
    
    @nonobjc class var authTextFieldUnderline: UIColor {
        return UIColor(red: 159/256, green: 158/256, blue: 159/256, alpha: 1.0)
    }
    
    @nonobjc class var authButton: UIColor {
        return UIColor(red: 246/256, green: 246/256, blue: 246/256, alpha: 1.0)
    }
    
    // Friend
    @nonobjc class var statusMessage: UIColor {
        return UIColor(red: 166/256, green: 166/256, blue: 166/256, alpha: 1.0)
    }
    
    // Image
    @nonobjc class var imageBorder: UIColor {
        return UIColor(red: 246/256, green: 221/256, blue: 42/256, alpha: 1.0)
    }
}
