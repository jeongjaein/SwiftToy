//
//  ViewController.swift
//  Feature-DEV
//
//  Created by 정재인 on 2020/07/07.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit
import SnapKit
import Then
class ViewController: UIViewController {
    let navigationTitleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleButtonSet()
    }
    func navigationTitleButtonSet() {
        navigationTitleButton.do {
            view.addSubview($0)
            $0.backgroundColor = .lightGray
            $0.setTitle("NavigationTitleAnimation", for: .normal)
            $0.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        }
        navigationTitleButton.snp.makeConstraints{
            $0.width.equalTo(300)
            $0.height.equalTo(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
}

