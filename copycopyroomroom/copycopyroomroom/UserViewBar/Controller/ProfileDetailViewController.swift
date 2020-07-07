//
//  ProfileDetail.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/04/03.
//

import UIKit





//view.alpha 를 사용하게 되면 PopUpView 의 Alpha 까지 변하게 되지만, withAlphaComponent 를 사용하게 되면 View 의 Alpha 값만 변하게 된다.
//또한 withAlphaComponent 의 값은 view.alpha 값과는 다르게 숫자가 높을수록 투명해진다는 사실을 잊지말자.

class ProfileDetailViewController : UIViewController{
    
    
    private let backgroundView = UIView()
    private var userProfileImage = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        //backgroundView set
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        //userprofileimage setup
        backgroundView.addSubview(userProfileImage)
        userProfileImage.translatesAutoresizingMaskIntoConstraints = false
        userProfileImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        userProfileImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        userProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userProfileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //dismiss gesture set
        let gesture = UITapGestureRecognizer(target: self, action: #selector(Dismiss(_:)))
        self.view.addGestureRecognizer(gesture)
        
    }
    
    @objc func Dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileDetailViewController : ProfilePassDelegate{
    func profilePass(name: String, Image: UIImage) {
        userProfileImage = UIImageView(image: Image)
    }
}

