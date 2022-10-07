//
//  BoundsViewController.swift
//  assignment1
//
//  Created by 이승헌 on 2022/10/07.
//

import UIKit

class BoundsViewController: UIViewController {
    
    private let viewOne: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    private let viewTwo: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .brown
        
        return view
    }()

    private let viewThree: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .darkGray
        
        return view
    }()
    
    private let operateButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Bounds 옮기기", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        operateButton.addTarget(self, action: #selector(changeBounds), for: .touchUpInside)
    }
    
    private func setLayout() {
        let componentList: [UIView] = [viewOne, operateButton]
        view.addSubViews(componentList)
        viewOne.addSubview(viewTwo)
        viewTwo.addSubview(viewThree)
        
        viewOne.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        viewTwo.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(500)
            make.top.equalToSuperview().inset(79)
            make.leading.equalToSuperview().inset(72)
        }
        
        viewThree.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(300)
            make.top.equalToSuperview().inset(157)
            make.leading.equalToSuperview().inset(98)
        }
        
        operateButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.bottom.equalToSuperview().inset(100)
            make.directionalHorizontalEdges.equalToSuperview().inset(100)
        }
    }
    
    private func moveBounds() {
        self.viewTwo.bounds.origin.x = 98
        self.viewTwo.bounds.origin.y = 157
    }
    
    @objc
    private func changeBounds() {
        moveBounds()
    }
}
