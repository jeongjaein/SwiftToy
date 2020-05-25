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
        createRxSwiftButton()
        createRxCocoa()
        let snapKitButton = UIButton()
        snapKitButton.setTitle("SnapKit", for: .normal)
        snapKitButton.frame = CGRect(x: 0, y: 400, width: 100, height: 100)
        self.view.addSubview(snapKitButton)
        snapKitButton.addTarget(self, action: #selector(snapKitButtonAction), for: .touchUpInside)
    }
    func createMVVMButton() {
        let mvvmExButton = UIButton()
        mvvmExButton.setTitle("MVVM", for: .normal)
//        mvvmExButton.setTitleColor(UIColor.gray, for: .normal)
        mvvmExButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        mvvmExButton.backgroundColor = .white
        self.view.addSubview(mvvmExButton)
        mvvmExButton.addTarget(self, action: #selector(mvvmExbuttonAction), for: .touchUpInside)
    }
    func createNotificationButton() {
        let notificationButton = UIButton()
        notificationButton.setTitle("noti", for: .normal)
//        notificationButton.setTitleColor(UIColor.gray, for: .normal)
        notificationButton.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
//        notificationButton.backgroundColor = .white
        self.view.addSubview(notificationButton)
        notificationButton.addTarget(self, action: #selector(notificationButtonAction), for: .touchUpInside)
    }
    func createRxSwiftButton() {
        let RxButton = UIButton()
        RxButton.setTitle("RxSwift", for: .normal)
//        RxButton.setTitleColor(UIColor.gray, for: .normal)
        RxButton.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
//        RxButton.backgroundColor = .white
        self.view.addSubview(RxButton)
        RxButton.addTarget(self, action: #selector(RxButtonAction), for: .touchUpInside)
    }
    func createRxCocoa() {
        let rxCocoaExButton = UIButton()
        rxCocoaExButton.setTitle("RxCocoa", for: .normal)
        rxCocoaExButton.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
        view.addSubview(rxCocoaExButton)
        rxCocoaExButton.addTarget(self, action: #selector(rxCocoaExButtonAction), for: .touchUpInside)
    }
    @objc func mvvmExbuttonAction() {
        let mvvmEx = MVVMEx()
        mvvmEx.modalPresentationStyle = .automatic
        self.present(mvvmEx, animated: true, completion: nil)
    }
    @objc func notificationButtonAction(){
        let notificationEx = NotificationEx()
        notificationEx.modalPresentationStyle = .automatic
        self.present(notificationEx, animated: true, completion: nil)
    }
    @objc func RxButtonAction(){
        let  rxSwiftEx = RxSwiftEx()
        rxSwiftEx.modalPresentationStyle = .automatic
        self.present(rxSwiftEx, animated: true, completion: nil)
    }
    @objc func rxCocoaExButtonAction(){
        let rxCocoaEx = RxCocoaEx()
        rxCocoaEx.modalPresentationStyle = .automatic
        self.present(rxCocoaEx, animated: true, completion: nil)
    }
    @objc func snapKitButtonAction(){
        let rxCocoaEx = SnapKitEx()
        rxCocoaEx.modalPresentationStyle = .automatic
        self.present(rxCocoaEx, animated: true, completion: nil)
    }
}

