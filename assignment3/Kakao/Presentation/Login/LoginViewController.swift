//
//  ViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/14.
//

import UIKit

import SnapKit
import Then
import Toast

class LoginViewController: UIViewController {
    
    private lazy var containerView: UIScrollView = UIScrollView()
    
    private let titleLabel: UILabel = UILabel().then {
        $0.text = I18N.Auth.authTitle
        $0.textColor = UIColor(named: "Font")
        $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
    }
    
    private let subTitleLabel: UILabel = UILabel().then {
        $0.text = I18N.Auth.loginDescription
        $0.textColor = UIColor.loginGrayText
        $0.font = .AppleSDGothicNeoMedium(ofSize: 15)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let idTextField: AuthTextField = AuthTextField().then {
        $0.placeholder = I18N.Auth.idTextFieldPlaceholder
        $0.textColor = UIColor(named: "Font")
    }
    
    private let idHiddenLabel: UILabel = UILabel().then {
        $0.text = I18N.Auth.idTextFieldPlaceholder
        $0.font = .AppleSDGothicNeoMedium(ofSize: 10)
        $0.textColor = .authTextField
        $0.isHidden = true
    }
    
    private let passwordTextField: AuthTextField = AuthTextField().then {
        $0.placeholder = I18N.Auth.passwordTextFieldPlaceholder
        $0.textColor = UIColor(named: "Font")
        $0.isSecureTextEntry = true
    }
    
    private let passwordHiddenLabel: UILabel = UILabel().then {
        $0.text = I18N.Auth.passwordTextFieldPlaceholder
        $0.font = .AppleSDGothicNeoMedium(ofSize: 10)
        $0.textColor = .authTextField
        $0.isHidden = true
    }
    
    private let loginButton: AuthButton = AuthButton().then {
        $0.setTitle(I18N.Auth.loginButton, for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    private let signupButton: AuthButton = AuthButton().then {
        $0.setTitle(I18N.Auth.signupButton, for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
   
    // label을 버튼으로 만들기 구현
    private let findAuthLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(named: "Font")
        $0.font = .AppleSDGothicNeoMedium(ofSize: 13)
        $0.textAlignment = .center
        $0.text = I18N.Auth.findLabel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension LoginViewController {
    private func setUI() {
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setAddTarget() {
        idTextField.addTarget(self, action: #selector(textFieldEditingBigin), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditingBigin), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(touchLoginButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        /*
         개인적으로 가독성을 위해서 리스트에 UIView들을 담고 해당 리스트를
         따로 만들어준 addSubviews에 넣어줬습니다.
         */
        view.addSubview(containerView)
        
        let contentComponent: [UIView] = [titleLabel, subTitleLabel, idTextField, passwordTextField, loginButton, signupButton, findAuthLabel]
        containerView.addSubviews(contentComponent)
        
        idTextField.addSubview(idHiddenLabel)
        passwordTextField.addSubview(passwordHiddenLabel)
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(60)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        idHiddenLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        passwordHiddenLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        findAuthLabel.snp.makeConstraints {
            $0.top.equalTo(signupButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    private func appearLabel(textField: UITextField) {
        if textField == idTextField {
            idHiddenLabel.isHidden = false
            if let text: String = textField.text, text.isEmpty {
                idHiddenLabel.isHidden = true
            }
            
        }
        
        if textField == passwordTextField {
            passwordHiddenLabel.isHidden = false
            if let text: String = textField.text, text.isEmpty {
                passwordHiddenLabel.isHidden = true
            }
        }
    }
    
    private func presentSignupCompleteView() {
        let idText: String = idTextField.text ?? ""
        let passwordText: String = passwordTextField.text ?? ""
        
        if idText.isEmpty || passwordText.isEmpty {
            var toastStyle: ToastStyle = ToastStyle()
            toastStyle.backgroundColor = UIColor(named: "Font")?.withAlphaComponent(0.5) ?? .black
            toastStyle.messageColor = UIColor(named: "Background") ?? .white
            toastStyle.messageFont = .AppleSDGothicNeoMedium(ofSize: 16)
            toastStyle.messageAlignment = .center
            
            self.view.makeToast(I18N.Auth.authToastMessage, duration: 2, style: toastStyle)
            return
        }
    }
    
    @objc
    private func textFieldEditingBigin(textField: UITextField) {
        appearLabel(textField: textField)
    }
    
    @objc
    private func touchLoginButton() {
        presentSignupCompleteView()
    }
}
