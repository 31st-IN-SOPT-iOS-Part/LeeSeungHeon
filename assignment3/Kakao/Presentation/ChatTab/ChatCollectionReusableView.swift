//
//  ChatCollectionReusableView.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/04.
//

import UIKit

class ChatCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ChatCollectionReusableView"
    
    private let headerView: UIView = UIView()
    
    private let imageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "nameImage")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCollectionReusableView {
    private func setLayout() {
        let component: [UIView] = [headerView, imageView]
        self.addSubviews(component)
        
        headerView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(headerView)
        }
    }
}
