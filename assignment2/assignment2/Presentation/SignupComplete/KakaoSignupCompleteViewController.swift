//
//  KakaoSignupCompleteViewController.swift
//  assignment2
//
//  Created by 이승헌 on 2022/10/12.
//

import UIKit

class KakaoSignupCompleteViewController: UIViewController, KakaoLoginViewDelegate {
    
    var email: String?
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "ooo님 \n 환영합니다"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let okButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.backgroundColor = UIColor(red: 254.0/256.0, green: 240.0/256.0, blue: 27.0/256.0, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    func signupEmailBind(email: String) {
        titleLabel.text = "\(email)님 \n 환영합니다"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setActionTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setActionTarget() {
        okButton.addTarget(self, action: #selector(touchOkButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let componentList: [UIView] = [titleLabel, okButton]
        view.addSubViews(componentList)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(300)
        }
        
        okButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.bottom.equalToSuperview().inset(350)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func dismissSignupCompleteView() {
        let friendListViewController: UIViewController = FriendListViewController()
        if let window = view.window?.windowScene?.keyWindow {
                    window.rootViewController = friendListViewController
        }
    }
    
    @objc
    private func touchOkButton() {
        dismissSignupCompleteView()
    }
    
    func sendUserEmail(email: String?) {
        self.titleLabel.text = "\(email ?? "아무개")님 \n 환영합니다"
    }
}
