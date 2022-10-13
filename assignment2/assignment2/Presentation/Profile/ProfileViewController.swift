//
//  ProfileViewController.swift
//  assignment2
//
//  Created by 이승헌 on 2022/10/12.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileButtonStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let profileViewDismissButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    private let boundView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    private let profileImageButton: UIImageView = {
        let image: UIImageView = UIImageView()
        image.image = UIImage(named: "profile")
        
        return image
    }()
    
    private let chatButton: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let chatImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.image = UIImage(named: "chat")
        
        return image
    }()
    
    private let chatLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    private let editButton: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let editImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.image = UIImage(named: "edit")
        
        return image
    }()
    
    private let editLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    private let storyButton: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let storyImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.image = UIImage(named: "story")
        
        return image
    }()
    
    private let storyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension ProfileViewController {
    private func setUI() {
        view.backgroundColor = .gray
    }
    
    private func setAddTarget() {
        profileViewDismissButton.addTarget(self, action: #selector(touchProfileViewDismissButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let viewComponentList: [UIView] = [profileViewDismissButton, profileImageButton, profileButtonStackView, nameLabel, boundView]
        view.addSubViews(viewComponentList)
        
        let chatViewComponent: [UIView] = [chatImage, chatLabel]
        let editViewComponent: [UIView] = [editImage, editLabel]
        let storyViewComponent: [UIView] = [storyImage, storyLabel]
        
        chatButton.addArrangedSubviews(chatViewComponent)
        editButton.addArrangedSubviews(editViewComponent)
        storyButton.addArrangedSubviews(storyViewComponent)
        
        let stackViewComponentList: [UIView] = [chatButton, editButton, storyButton]
        profileButtonStackView.addArrangedSubviews(stackViewComponentList)
        
        profileViewDismissButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
        }
        
        profileImageButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(470)
            make.centerX.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(96)
        }
        
        profileButtonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(48)
            make.centerX.equalToSuperview()
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        boundView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.bottom).offset(42)
        }
        
        chatImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        editImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        storyImage.snp.makeConstraints { make in
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
    }
    
    private func dismissProfileView() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func touchProfileViewDismissButton() {
        dismissProfileView()
    }
}
