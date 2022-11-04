//
//  FriendListViewController.swift
//  assignment2
//
//  Created by 이승헌 on 2022/10/12.
//

import UIKit

let deviceWidth: CGFloat = UIScreen.main.bounds.width
let deviceHeight: CGFloat = UIScreen.main.bounds.height

class FriendListViewController: UIViewController {

    private let headView: UIView = {
        let view: UIView = UIView()
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "친구"
        label.font = .boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let settingButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "setting"), for: .normal)
        
        return button
    }()
    
    private let contentView: UIView = {
        let view: UIView = UIView()
        
        return view
    }()
    
    private let profileButton: UIButton = {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension FriendListViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        profileButton.addTarget(self, action: #selector(touchProfileButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let viewComponentList: [UIView] = [headView, contentView]
        view.addSubViews(viewComponentList)
        
        let headViewComponentList: [UIView] = [titleLabel, settingButton]
        headView.addSubViews(headViewComponentList)
        
        let contentViewComponentList: [UIView] = [profileButton]
        contentView.addSubViews(contentViewComponentList)
        
        
        // head view
        headView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(52)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.directionalVerticalEdges.equalToSuperview()
            make.leading.equalTo(headView).inset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(4)
            make.directionalVerticalEdges.equalToSuperview()
        }
        
        // content view
        contentView.snp.makeConstraints { make in
            make.top.equalTo(headView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.width.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(14)
            make.top.equalToSuperview().inset(14)
        }
    }
    
    private func presentProfileView() {
        let profileViewController: UIViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        
        self.present(profileViewController, animated: true)
    }
    
    @objc
    private func touchProfileButton() {
        presentProfileView()
    }
}
