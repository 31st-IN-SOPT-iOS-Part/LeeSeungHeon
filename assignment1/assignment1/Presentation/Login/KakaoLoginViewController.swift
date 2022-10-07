//
//  KakaoLoginViewController.swift
//  assignment1
//
//  Created by 이승헌 on 2022/10/05.
//

import UIKit
import SnapKit

protocol KakaoLoginViewDelegate: AnyObject {
    func sendUserEmail(email: String?)
}

class KakaoLoginViewController: UIViewController {
    
    // 제목
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // 부제목
    private let subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 2
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
    
    // 로그인 버튼
    private let loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 4
        return button
    }()
    
    // 회원가입 버튼
    private let signupButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 4
        return button
    }()
    
    // 계정 찾기 & 비밀번호 찾기
    private let findAccountInfoLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    weak var delegate: KakaoLoginViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension KakaoLoginViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        loginButton.addTarget(self, action: #selector(touchLoginButton), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(touchSignupButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let componentList: [UIView] = [titleLabel, subtitleLabel, emailTextField, emailUnderline, passwordTextField, passwordUnderline, loginButton, signupButton, findAccountInfoLabel]
        view.addSubViews(componentList)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        
        emailUnderline.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailUnderline.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        
        passwordUnderline.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordUnderline.snp.bottom).offset(30)
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.height.equalTo(44)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        findAccountInfoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signupButton.snp.bottom).offset(15)
        }
    }
    
    private func presentToSignupCompleteView() {
        let nextViewController = KakaoSignupCompleteViewController()
        nextViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        
        self.delegate = nextViewController
        self.delegate?.sendUserEmail(email: self.emailTextField.text)

        
        self.present(nextViewController, animated: true)
    }
    
    private func pushToSignupView() {
        let KakaoSignupViewController: UIViewController = KakaoSignupViewController()
        self.navigationController?.pushViewController(KakaoSignupViewController, animated: true)
    }
    
    @objc
    private func touchLoginButton() {
        presentToSignupCompleteView()
    }
    
    @objc
    private func touchSignupButton() {
        pushToSignupView()
    }
}
