//
//  ImageViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/04.
//

import UIKit


class ImageViewController: UIViewController {
    
    public var selectedImageList: [Int] = []
    
    private let headerView: UIView = UIView()
    
    private let closeButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "Vector"), for: .normal)
    }
    
    private let titleLabel: UILabel = UILabel().then {
        $0.text = "최근 항목"
        $0.font = .AppleSDGothicNeoRegular(ofSize: 16)
    }
    
    private let sendButton: UIButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = .AppleSDGothicNeoRegular(ofSize: 14)
        $0.setTitleColor(UIColor(named: "Font"), for: .normal)
    }
    
    private let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    private lazy var imageCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    private func register() {
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
        register()
    }
}

extension ImageViewController {
    private func setUI() {
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setAddTarget() {
        closeButton.addTarget(self, action: #selector(touchCloseButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        let viewComponent: [UIView] = [headerView, imageCollectionView]
        view.addSubviews(viewComponent)
        
        let headerComponent: [UIView] = [closeButton, titleLabel, sendButton]
        headerView.addSubviews(headerComponent)
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(38)
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func dismissImageViewController() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func touchCloseButton() {
        dismissImageViewController()
    }
}

extension ImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = (UIScreen.main.bounds.width - 20) / 3
        return CGSize(width: screenWidth, height: 119)
    }
}

extension ImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(model: imageDummyData[indexPath.item])
        return imageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageCell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        
        if selectedImageList.contains(indexPath.row) {
            guard let index = selectedImageList.firstIndex(of: indexPath.row) else { return }
            selectedImageList.remove(at: index)
            imageCell.unSelectBorder()
            selectedImageList.forEach {
                let cell = collectionView.cellForItem(at: [0, $0]) as! ImageCollectionViewCell
                guard let newIndex = selectedImageList.firstIndex(of: $0) else { return }
                cell.changeIndexLabel(index: newIndex)
            }
        } else {
            selectedImageList.append(indexPath.row)
            guard let index = selectedImageList.firstIndex(of: indexPath.row) else { return }
            imageCell.selectBorder(index: index)
        }
    }
}
