//
//  ChatViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let tabHeaderView: UIView = UIView()
    
    private let chatLabel: UILabel = UILabel().then {
        $0.text = "채팅"
        $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
    }
    
    private let openChatLabel: UILabel = UILabel().then {
        $0.text = "오픈채팅"
        $0.textColor = UIColor.statusMessage
        $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
    }
    
    private let newChatButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "iconPlus"), for: .normal)
    }
    
    private let settingButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "settingIcon"), for: .normal)
    }
    
    private let headerView: UIView = UIView()
    
    private let headerImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "chatTitleImage")
    }
    
    private let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    private lazy var chatCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    final let chatHeight: CGFloat = 50
    final let chatInset: UIEdgeInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
        setLayout()
        register()
    }
}

extension ChatViewController {
    private func setUI() {
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setAddTarget() {
        newChatButton.addTarget(self, action: #selector(touchNewChatButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
        
        let viewComponent: [UIView] = [tabHeaderView, chatCollectionView]
        view.addSubviews(viewComponent)
        
        let headerViewComponent: [UIView] = [chatLabel, openChatLabel, newChatButton, settingButton]
        tabHeaderView.addSubviews(headerViewComponent)
        
        tabHeaderView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(52)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        chatLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
        }
        
        openChatLabel.snp.makeConstraints {
            $0.leading.equalTo(chatLabel.snp.trailing).offset(7)
            $0.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        newChatButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(46)
        }
        
        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(tabHeaderView.snp.bottom)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        chatCollectionView.register(ChatCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionReusableView.identifier)
    }
    
    private func presentImageCollectionView() {
        let nextViewController = ImageViewController()
        nextViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        self.present(nextViewController, animated: true)
    }
    
    @objc
    private func touchNewChatButton() {
        presentImageCollectionView()
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 50)
    }
}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as? ChatCollectionViewCell else { return UICollectionViewCell() }
        chatCell.dataBind(model: chatDummyData[indexPath.item])
        return chatCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ChatCollectionReusableView", for: indexPath)
            return headerView
        default:
            assert(false, "응 아니야")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return chatInset
    }
}
