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
        createMVVMButton()
        createNotificationButton()
    }
    
    func createMVVMButton() {
        let mvvmExButton = UIButton()
        mvvmExButton.setTitle("MVVM", for: .normal)
        mvvmExButton.setTitleColor(UIColor.gray, for: .normal)
        mvvmExButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        mvvmExButton.backgroundColor = .white
        self.view.addSubview(mvvmExButton)
        mvvmExButton.addTarget(self, action: #selector(mvvmExbuttonAction), for: .touchUpInside)
    }
    func createNotificationButton() {
        let notificationButton = UIButton()
        notificationButton.setTitle("noti", for: .normal)
        notificationButton.setTitleColor(UIColor.gray, for: .normal)
        notificationButton.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        notificationButton.backgroundColor = .white
        self.view.addSubview(notificationButton)
        notificationButton.addTarget(self, action: #selector(notificationButtonAction), for: .touchUpInside)
    }
    @objc func mvvmExbuttonAction() {
        let test = MVVMEx()
        test.modalPresentationStyle = .automatic
        self.present(test, animated: true, completion: nil)
    }
    @objc func notificationButtonAction(){
        let test = NotificationEx()
        test.modalPresentationStyle = .automatic
        self.present(test, animated: true, completion: nil)
    }
    
}

