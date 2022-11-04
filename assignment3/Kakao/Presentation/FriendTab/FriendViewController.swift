//
//  FriendViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

import Then
import SnapKit

class FriendViewController: UIViewController {
    
    private let tabHeaderView: UIView = UIView()
    
    private let tabHeaderTitleLabel: UILabel = UILabel().then {
        $0.text = "친구"
        $0.font = .AppleSDGothicNeoMedium(ofSize: 22)
    }
    
    private let tabHeaderSettingButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "settingIcon"), for: .normal)
    }
    
    private let headerView: UIView = UIView()
    
    private let profileImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "imageFriend")
    }
    
    private let nameLabel: UILabel = UILabel().then {
        $0.text = "Crayon"
        $0.font = .AppleSDGothicNeoSemiBold(ofSize: 16)
        $0.textColor = UIColor(named: "Font")
    }
    
    private let statusMessage: UILabel = UILabel().then {
        $0.text = "iOS 개발중..."
        $0.font = .AppleSDGothicNeoRegular(ofSize: 11)
        $0.textColor = UIColor.statusMessage
    }
    
    private lazy var friendTableView: UITableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.tableHeaderView = headerView
        $0.tableHeaderView?.frame.size.height = 75
        $0.delegate = self
        $0.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setUI()
        setAddTarget()
        setLayout()
    }
}

extension FriendViewController {
    private func setUI() {
        view.backgroundColor = UIColor(named: "Background")
    }
    
    private func setAddTarget() {
        
    }
    
    private func setLayout() {
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(tabHeaderView)
        view.addSubview(friendTableView)
        
        let tabHeaderViewComponent: [UIView] = [tabHeaderTitleLabel, tabHeaderSettingButton]
        tabHeaderView.addSubviews(tabHeaderViewComponent)
        
        tabHeaderView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(52)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        tabHeaderTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        tabHeaderSettingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        friendTableView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(tabHeaderView.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            // $0.height.equalTo(50 * userDummyData.count)
        }

        let headerComponent: [UIView] = [profileImage, nameLabel, statusMessage]
        headerView.addSubviews(headerComponent)
        
        profileImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(11)
            $0.top.equalToSuperview().inset(19)
        }
        
        statusMessage.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(11)
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
        }
    }
    
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
}

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if editingStyle == .delete {
                multiProfile.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case 1:
            if editingStyle == .delete {
                birthDay.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case 2:
            print(0)
        case 3:
            if editingStyle == .delete {
                bookMark.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case 4:
            if editingStyle == .delete {
                recommendedFriend.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case 5:
            if editingStyle == .delete {
                channel.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case 6:
            if editingStyle == .delete {
                userDummyData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            print(0)
        }
    }
}

extension FriendViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "내 멀티프로필"
        case 1:
            return "생일인 친구"
        case 2:
            return "업데이트한 친구"
        case 3:
            return "즐겨찾기"
        case 4:
            return "추천친구"
        case 5:
            return "채널"
        case 6:
            return "친구"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return multiProfile.count
        case 1:
            return birthDay.count
        case 2:
            return 1
        case 3:
            return bookMark.count
        case 4:
            return recommendedFriend.count
        case 5:
            return channel.count
        case 6:
            return userDummyData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as?
            FriendTableViewCell else { return UITableViewCell()}
        if indexPath.section == 0 {
            friendCell.dataBind(model: multiProfile[indexPath.row])
        }
        
        if indexPath.section == 1 {
            friendCell.dataBind(model: birthDay[indexPath.row])
        }
        
        if indexPath.section == 3 {
            friendCell.dataBind(model: bookMark[indexPath.row])
            
        }
        
        if indexPath.section == 4 {
            friendCell.dataBind(model: recommendedFriend[indexPath.row])
        }
        
        if indexPath.section == 5 {
            friendCell.dataBind(model: channel[indexPath.row])
        }
        
        if indexPath.section == 6 {
            friendCell.dataBind(model: userDummyData[indexPath.row])
        }
        return friendCell
    }
}
