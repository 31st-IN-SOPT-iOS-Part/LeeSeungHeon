//
//  HashTagViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class HashTagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension HashTagViewController {
    private func setUI() {
        view.backgroundColor = .systemGray2
    }
    
    private func setAddTarget() {
        
    }
    
    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
