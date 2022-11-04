//
//  AuthButton.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/19.
//

import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}

extension AuthButton {
    private func setUI() {
        self.backgroundColor = .authButton
        self.titleLabel?.font = .AppleSDGothicNeoMedium(ofSize: 15)
        self.setTitleColor(UIColor(named: "Font"), for: .normal)
        self.layer.cornerRadius = 4
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
}
