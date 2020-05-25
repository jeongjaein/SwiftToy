//
//  SnapKitViewController.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/26.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

import SnapKit

class SnapKitEx: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstButton = UIButton()
        firstButton.layer.cornerRadius = 10
        firstButton.setTitle("movingButton", for: .normal)
        firstButton.backgroundColor = .lightGray
        view.addSubview(firstButton)
        firstButton.snp.makeConstraints{make in
//            make.top.equalTo(view).offset(20)
//            make.leading.equalTo(view).offset(20)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        
    }
}
