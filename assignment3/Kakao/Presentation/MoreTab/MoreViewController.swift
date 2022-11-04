//
//  MoreViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension MoreViewController {
    private func setUI() {
        view.backgroundColor = .systemGray4
    }
    
    private func setAddTarget() {
        
    }
    
    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
