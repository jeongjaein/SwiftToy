//
//  SnapKitViewController.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/26.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class SnapKitEx: UIViewController {
    var disposeBag = DisposeBag()
    let firstButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        createFirstButton()
        moveFirstButton()
    }
    func createFirstButton() {
        
        firstButton.layer.cornerRadius = 10
        firstButton.setTitle("movingButton", for: .normal)
        firstButton.backgroundColor = .lightGray
        view.addSubview(firstButton)
        firstButton.snp.makeConstraints{make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
    func moveFirstButton(){
        firstButton.rx.tap
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { tap in
                print(tap)
//                self.firstButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 150).isActive = true
            })
        .disposed(by: disposeBag)
    }
}
