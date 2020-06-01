//
//  RxCocoaExViewModel.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/06/01.
//  Copyright © 2020 정재인. All rights reserved.
//

import RxSwift
import UIKit
import Foundation
import RxCocoa

class RxCocoaExViewModel {
    
    let emailText = BehaviorSubject(value: "")

    let isEmailValid = BehaviorSubject(value: false)
    let isPasswordValid = BehaviorSubject(value: false)
    
    init(){
        _ = emailText.distinctUntilChanged()
        .map(checkEmailValid)
            .bind(to: isEmailValid)
    }
    
    func setEmailText(_ email: String) {
        let isValid = checkEmailValid(email)
        isEmailValid.onNext(isValid)
    }
    
    func setPasswordText(_ pw: String) {
        let isValid = checkPasswordValid(pw)
        isPasswordValid.onNext(isValid)
    }
    
    private func checkEmailValid( _ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 5
    }

}
