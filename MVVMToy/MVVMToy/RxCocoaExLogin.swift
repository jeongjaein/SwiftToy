//
//  RxCocoaExLogin.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/26.
//  Copyright © 2020 정재인. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit
import SnapKit

class RxCocoaExLogin: UIViewController {
let screenSize: CGRect = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
    }
    func setNavigationBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        let navItem = UINavigationItem(title: "LOGIN Success")
        let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(back))
        navItem.leftBarButtonItem = backItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }

}
