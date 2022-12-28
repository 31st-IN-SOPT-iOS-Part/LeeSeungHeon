//
//  AuthTextField.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/18.
//

import UIKit

class AuthTextField: UITextField {
    private let underLineView: UIView = UIView().then {
        $0.backgroundColor = .authTextFieldUnderline
    }
    
    // 해당 frame을 가지고 구현하고자 하는 뷰의 중심과 경계선을 지정해줌
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    /*
     required init 하위 클래스에서 본인만의 생성자를 재정의하기 위해
     사용
     */
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}

extension AuthTextField {
    private func setUI() {
        self.textColor = .authTextField
        self.font = .AppleSDGothicNeoMedium(ofSize: 17)
        self.clearButtonMode = .whileEditing
    }
    
    private func setLayout() {
        addSubview(underLineView)
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
