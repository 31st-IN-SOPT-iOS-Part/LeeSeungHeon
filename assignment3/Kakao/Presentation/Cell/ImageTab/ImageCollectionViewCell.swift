//
//  ImageCollectionViewCell.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/04.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView: UIImageView = UIImageView()
    
    private let indexView: UIView = UIView().then {
        $0.backgroundColor = UIColor.imageBorder
        $0.layer.cornerRadius = 9
        $0.isHidden = true
    }
    
    private let indexTextLabel: UILabel = UILabel().then {
        $0.font = .AppleSDGothicNeoRegular(ofSize: 10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func selectBorder(index: Int) {
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.imageBorder.cgColor
        indexView.isHidden = false
        indexTextLabel.text = String(index + 1)
    }
    
    public func unSelectBorder() {
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = .none
        indexView.isHidden = true
    }
    
    public func changeIndexLabel(index: Int) {
        indexTextLabel.text = String(index + 1)
    }
}

extension ImageCollectionViewCell {
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
        contentView.addSubview(indexView)
        indexView.addSubview(indexTextLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        indexView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
        
        indexTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().inset(6)
            $0.centerY.equalToSuperview().inset(4)
        }
    }
    
    public func dataBind(model: ImageModel) {
        imageView.image = UIImage(named: model.image)
    }
}
