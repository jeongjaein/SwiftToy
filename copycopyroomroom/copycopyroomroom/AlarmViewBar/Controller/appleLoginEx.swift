//
//  appleLoginEx.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/05/11.
//

import UIKit
import AuthenticationServices

class appleLoginEx : UIViewController{
    
    @IBOutlet weak var loginProviderStackView : UIStackView!
    var appleLoginButton = ASAuthorizationAppleIDButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(appleLoginButton)
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        appleLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appleLoginButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
//        view .addSubview(loginProviderStackView)
//        self.loginProviderStackView.addArrangedSubview(appleLoginButton)
        
        let indicatorEx = IndicatorEx()
        indicatorEx.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(indicatorEx, animated: true, completion: nil)
        
    }
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        
    }
}
extension appleLoginEx : ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("test2222")
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
            print(userIdentifier, userFirstName, userLastName, userEmail)
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                    //이미 자격증명이 되어있음 로그인 건너뛰어도됨
                    print("valid")
                    break
                case .revoked:
                    //자격증명이 취소되엇다.
                    print("revoked")
                    break
                case .notFound:
                    //로그인 화면으로 이동해줘야됨
                    print("no credential")
                    break
                default:
                    break
                }
            }
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            print("test333")
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            //Navigate to other view controller
        }
        
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("somethingwrong")
    }
}
extension appleLoginEx: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

