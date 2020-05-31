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
    
    let navItem = UINavigationItem(title: "LOGIN Success")
    let screenSize: CGRect = UIScreen.main.bounds
    var navBar = UINavigationBar()
    var successImage = UIImageView()
    var changeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setNavigationBar()
        createImageVIew()
        successImage.addSubview(changeButton)
        //버튼누르면 사진바꾸기 rx로 해보자
        changeButton.setTitle("굿", for: .normal)
        changeButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.centerXAnchor.constraint(lessThanOrEqualTo: successImage.centerXAnchor, constant: 0).isActive = true
        changeButton.centerYAnchor.constraint(lessThanOrEqualTo: successImage.centerYAnchor, constant: 0).isActive = true
        changeButton.backgroundColor = .lightGray
    }
    
    func setNavigationBar() {
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.screenSize.width, height: 50))
        let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(back))
        navItem.leftBarButtonItem = backItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func createImageVIew() {
        view.addSubview(successImage)
        successImage.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        successImage.image = UIImage(named: "swifticon")
        successImage.translatesAutoresizingMaskIntoConstraints = false
        successImage.topAnchor.constraint(equalTo: view.topAnchor , constant: 50).isActive = true
        successImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        successImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
}
