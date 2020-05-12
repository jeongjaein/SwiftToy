//
//  ViewController.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/11.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    func createButton() {
        let mvvmExButton = UIButton()
        mvvmExButton.setTitle("MVVM", for: .normal)
        mvvmExButton.setTitleColor(UIColor.gray, for: .normal)
        mvvmExButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        mvvmExButton.backgroundColor = .white
        self.view.addSubview(mvvmExButton)
        
        mvvmExButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    @objc func buttonAction() {
        let test = MVVMEx()
        test.modalPresentationStyle = .automatic
        self.present(test, animated: true, completion: nil)
    }
    
}

