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
//    var viewModel = 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        super.viewDidLoad()
        self.setNavigationBar()
        createEmailTextField()
        createPassWordTextField()
        createCheckingPointForEmail()
        createCheckingPointForPassWord()
        createLoginButton()
        bindUI()
    }
    
    func createCheckingPointForEmail() {
        view.addSubview(idValidView)
        idValidView.layer.cornerRadius = 5
        idValidView.backgroundColor = .red
        idValidView.translatesAutoresizingMaskIntoConstraints = false
        idValidView.leadingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 10).isActive = true
        idValidView.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor, constant: 0).isActive = true
        idValidView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        idValidView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func createCheckingPointForPassWord() {
        view.addSubview(pwValidView)
        pwValidView.layer.cornerRadius = 5
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
    
    func createLoginButton() {
        view.addSubview(loginButton)
        loginButton.isEnabled = false
        loginButton.setTitle("fill the data", for: .normal )
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loginButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.addTarget(self, action: #selector(goToLoginSuccess), for: .touchUpInside)
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
    
    //이메일과 비밀번호 모두 valid함수로 확인 후 둘다 true일때 로그인버튼을 활성화 시켜주는 그런느낌이지
    func bindUI(){
//        idField.rx.text.orEmpty
//            .subscribe(onNext: email in
//                self.rx)
    }
        
}




//second bindUI func
//func bindUI(){
          //input : 아이디 비번 입력, 비번 입력
    //        let emailInputOb = emailTextField.rx.text.orEmpty.asObservable()
    //        let emailValidOb = emailInputOb.map(checkEmailValid)
    //
    //        let pwInputOb = passWordTextField.rx.text.orEmpty.asObservable()
    //        let pwValidOb = pwInputOb.map(checkPasswordValid)
    //
    //        //output : 불린, 로그인버튼이네이블
    //        emailValidOb.subscribe(onNext: {b in self.idValidView.isHidden = b})
    //            .disposed(by: disposeBag)
    //
    //        pwValidOb.subscribe(onNext: {b in self.pwValidView.isHidden = b})
    //            .disposed(by: disposeBag)
    //
    //        Observable.combineLatest(emailValidOb, pwValidOb, resultSelector: { $0 && $1 })
    //            .subscribe(onNext: {b in
    //                if b{
    //                    self.loginButton.isEnabled = b
    //                    self.loginButton.setTitle("Login", for: .normal)
    //                }
    //                else{
    //                    self.loginButton.isEnabled = b
    //                    self.loginButton.setTitle("fill data", for: .normal )
    //                }
    //            })
    //            .disposed(by: disposeBag)
//}


//first bindUI func
//func bindUI(){
//        emailTextField.rx.text.orEmpty
//            //            .filter{$0 != nil}
//            //            .map{$0!}//optional 언래핑 을 위에 or로 extension에서 제공해줌
//            .map(checkEmailValid)
//            .subscribe(onNext: {bool in
//                self.idValidView.isHidden = bool
//            })
//            .disposed(by: disposeBag)
//        passWordTextField.rx.text.orEmpty
//            .map(checkPasswordValid)
//            .subscribe(onNext: {bool in
//                self.pwValidView.isHidden = bool
//            })
//            .disposed(by: disposeBag)
//        //두개이상의 옵저버블을 합쳐 하나의 옵저버블로 만들어 버렸다.
//        Observable.combineLatest( emailTextField.rx.text.orEmpty.map(checkEmailValid),
//            passWordTextField.rx.text.orEmpty.map(checkPasswordValid),
//            resultSelector: { s1, s2 in s1 && s2 }
//        )
//            .subscribe(onNext: {b in
//                print(b)
//
//                if b{
//                    self.loginButton.setTitle("Login", for: .normal)
////                    self.loginButton.setTitleColor(.green, for: .highlighted)
//                    self.loginButton.isEnabled = b
//                }
//                else{
//                    self.loginButton.setTitle("fill the data", for: .normal)
//                }
//            })
//            .disposed(by: disposeBag)
//}
