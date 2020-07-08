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
    let loadingAnimationButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimationButtonSet()
    }
    func loadingAnimationButtonSet() {
        loadingAnimationButton.do {
            view.addSubview($0)
//            $0.backgroundColor = .lightGray
            $0.setTitle("Loading Animation", for: .normal)
            $0.setTitleColor(UIColor(named: "default"), for: .normal)
            $0.addTarget(self, action: #selector(loadingAnimationButtonAction), for: .touchDown)
        }
        loadingAnimationButton.snp.makeConstraints{
            $0.width.equalTo(300)
            $0.height.equalTo(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    @objc func loadingAnimationButtonAction(sender: UIButton!) {
        let loadingAnimationViewController = LoadingAnimationViewController()
        loadingAnimationViewController.modalPresentationStyle = .automatic
        self.present(loadingAnimationViewController, animated: true, completion: nil)
    }
}

