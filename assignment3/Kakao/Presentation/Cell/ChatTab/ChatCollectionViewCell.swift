//
//  ChatCollectionViewCell.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/04.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChatCollectionViewCell"
    
    private let chatContainerView: UIView = UIView()
    
    private let chatImageView: UIImageView = UIImageView()
    
    private let chatTitleLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(named: "Font")
        $0.font = .AppleSDGothicNeoSemiBold(ofSize: 12)
    }
    
    private let chatMessageLabel: UILabel = UILabel().then {
        $0.textColor = UIColor.statusMessage
        $0.font = .AppleSDGothicNeoRegular(ofSize: 11)
    }
    
    private let chatTimeLabel: UILabel = UILabel().then {
        $0.textColor = UIColor.statusMessage
        $0.font = .AppleSDGothicNeoRegular(ofSize: 8)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCollectionViewCell {
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        let component: [UIView] = [chatContainerView, chatTitleLabel, chatMessageLabel, chatTimeLabel]
        contentView.addSubviews(component)
        
        chatContainerView.addSubview(chatImageView)
        chatContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        chatImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        chatTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(chatContainerView.snp.trailing).offset(11)
            $0.top.equalToSuperview().inset(10)
        }
        
        chatMessageLabel.snp.makeConstraints {
            $0.leading.equalTo(chatContainerView.snp.trailing).offset(11)
            $0.top.equalTo(chatTitleLabel.snp.bottom).offset(3)
        }
        
        chatTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    public func dataBind(model: ChatModel) {
        chatImageView.image = UIImage(named: model.profileImage)
        chatTitleLabel.text = model.title
        chatMessageLabel.text = model.message
        chatTimeLabel.text = model.time
    }
}
