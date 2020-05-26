//
//  RxCocoaEx.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/21.
//  Copyright © 2020 정재인. All rights reserved.
//


import RxCocoa
import RxSwift
import UIKit
import SnapKit

class RxCocoaEx: UIViewController{
    var disposeBag = DisposeBag()
    let screenSize: CGRect = UIScreen.main.bounds
    var emailTextField = UITextField()
    var passWordTextField = UITextField()
    var idValidView = UIView()
    var pwValidView = UIView()
    var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        super.viewDidLoad()
        self.setNavigationBar()
        createEmailTextField()
        createPassWordTextField()
        createCheckingPointForEmail()
        createCheckingPointForPassWord()
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loginButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.addTarget(self, action: #selector(goToLoginSuccess), for: .touchUpInside)
        bindUI()
    }
    func createCheckingPointForEmail() {
        view.addSubview(idValidView)
        idValidView.backgroundColor = .red
        idValidView.translatesAutoresizingMaskIntoConstraints = false
        idValidView.leadingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 10).isActive = true
        idValidView.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor, constant: 0).isActive = true
        idValidView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        idValidView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    func createCheckingPointForPassWord() {
        view.addSubview(pwValidView)
        pwValidView.backgroundColor = .red
        pwValidView.translatesAutoresizingMaskIntoConstraints = false
        pwValidView.leadingAnchor.constraint(equalTo: passWordTextField.trailingAnchor, constant: 10).isActive = true
        pwValidView.centerYAnchor.constraint(equalTo: passWordTextField.centerYAnchor, constant: 0).isActive = true
        pwValidView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        pwValidView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    func createEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.backgroundColor = .gray
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: screenSize.width - 100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func createPassWordTextField() {
        view.addSubview(passWordTextField)
        passWordTextField.backgroundColor = .gray
        passWordTextField.translatesAutoresizingMaskIntoConstraints = false
        passWordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        passWordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passWordTextField.widthAnchor.constraint(equalToConstant: screenSize.width - 100).isActive = true
        passWordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setNavigationBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        let navItem = UINavigationItem(title: "LOGIN")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    @objc func goToLoginSuccess(){
        self.view.setNeedsLayout()
        let rxCocoaExLogin = RxCocoaExLogin()
        rxCocoaExLogin.modalPresentationStyle = .fullScreen
        self.present(rxCocoaExLogin, animated: true, completion: nil)
    }
    func checkEmailValid(_ email: String) -> Bool{
        return email.contains("@") && email.contains(".")
    }
    func checkPasswordValid( _ password: String) -> Bool {
        return password.count > 5
    }
    func bindUI(){
        emailTextField.rx.text
            .filter{$0 != nil}
            .map{$0!}
            .map(checkEmailValid)
            .subscribe(onNext: {s in
                print(s)
            })
            .disposed(by: disposeBag)
    }
}


