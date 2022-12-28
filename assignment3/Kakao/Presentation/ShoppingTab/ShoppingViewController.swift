//
//  ShoppingViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class ShoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension ShoppingViewController {
    private func setUI() {
        view.backgroundColor = .systemGray3
    }
    
    private func setAddTarget() {
        
    }
    
    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
