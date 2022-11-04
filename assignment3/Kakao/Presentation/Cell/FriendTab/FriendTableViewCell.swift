//
//  FriendTableViewCell.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    private let profileImageView: UIImageView = UIImageView()
    
    private let nameLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(named: "Font")
        $0.font = .AppleSDGothicNeoMedium(ofSize: 12)
    }
    
    private let statusMessageLabel: UILabel = UILabel().then {
        $0.textColor = UIColor.statusMessage
        $0.font = .AppleSDGothicNeoMedium(ofSize: 11)
    }
    
    static let identifier = "FriendTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

extension FriendTableViewCell {
    public func dataBind(model: UserModel) {
        profileImageView.image = UIImage(named: model.profileImage)
        nameLabel.text = model.name
        statusMessageLabel.text = model.statusMessage
    }
    
    private func setLayout() {
        let friendCellComponent: [UIView] = [profileImageView, nameLabel, statusMessageLabel]
        contentView.addSubviews(friendCellComponent)
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.directionalVerticalEdges.equalToSuperview().inset(5)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        statusMessageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
    }
}
