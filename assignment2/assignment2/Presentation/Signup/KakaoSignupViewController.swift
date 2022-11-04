//
//  KakaoSignupViewController.swift
//  assignment2
//
//  Created by 이승헌 on 2022/10/12.
//

import UIKit

class KakaoSignupViewController: UIViewController {

    // 제목
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // 이메일 입력 창
    private let emailTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    // 이메일 입력 밑줄
    private let emailUnderline: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 비밀번호 입력 창
    private let passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // 비밀번호 입력 밑줄
    private let passwordUnderline: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 비밀번호 확인 입력 창
    private let passwordCheckTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // 비밀번호 확인 입력 밑줄
    private let passwordCheckUnderline: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // 계정 생성 버튼
    private let signupButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 4
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }

}

extension KakaoSignupViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        signupButton.addTarget(self, action: #selector(touchSignupButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let componentList: [UIView] = [titleLabel, emailTextField, emailUnderline, passwordTextField, passwordUnderline, passwordCheckTextField, passwordCheckUnderline, signupButton]
        view.addSubViews(componentList)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(186)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }

        emailUnderline.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailUnderline).inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }

        passwordUnderline.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordUnderline).inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }

        passwordCheckUnderline.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckUnderline.snp.bottom).offset(30)
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func presentToSignupCompleteView() {
        let nextViewController = KakaoSignupCompleteViewController()
        nextViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        
        if let email: String = emailTextField.text {
            nextViewController.signupEmailBind(email: email)
        }
        
        self.present(nextViewController, animated: true)
    }
    
    @objc
    private func touchSignupButton() {
        presentToSignupCompleteView()
    }
}
