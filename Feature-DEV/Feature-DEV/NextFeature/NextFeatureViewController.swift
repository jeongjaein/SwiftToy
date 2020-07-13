//
//  NextFeatureViewController.swift
//  Feature-DEV
//
//  Created by 정재인 on 2020/07/13.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NextFeatureViewController: UIViewController {
    let pushTestButton = UIButton()
//    let navigationController = UINavigationController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadingAnimationButtonSet()
    }
    func loadingAnimationButtonSet() {
        pushTestButton.do {
            view.addSubview($0)
            $0.setTitle("Push Test", for: .normal)
            $0.setTitleColor(UIColor(named: "default"), for: .normal)
            $0.addTarget(self, action: #selector(loadingAnimationButtonAction), for: .touchDown)
        }
        pushTestButton.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    @objc func loadingAnimationButtonAction(sender: UIButton!) {
        print("test")
        let pushViewTestViewController = PushViewTestViewController()
//        pushViewTestViewController.modalPresentationStyle = .automatic
//        self.present(pushViewTestViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(pushViewTestViewController, animated: true)
    }
}
