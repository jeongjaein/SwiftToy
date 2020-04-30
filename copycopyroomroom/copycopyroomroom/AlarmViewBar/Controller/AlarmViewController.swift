//
//  AlarmViewController.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/04/12.
//

import UIKit

class AlarmViewController : UIViewController{
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let titleButton = UIButton()
    let bodyButton = UIButton()
    
    fileprivate func setUpLabels() {
        titleLabel.backgroundColor = .white
        bodyLabel.backgroundColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.text = "Welcome To Company XYZ"
        titleLabel.font = UIFont(name: "Futura", size: 25)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Thanks so much for downloading our brand new app and giving us a try."
        
    }
    
    fileprivate func setUpButtons() {
        titleButton.backgroundColor = .lightGray
        titleButton.setTitle("OK", for: .normal)
        bodyButton.backgroundColor = .lightGray
        bodyButton.setTitle("OK", for: .normal)
    }
    
    fileprivate func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews:[titleLabel,bodyLabel])
        
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    fileprivate func setUpButtonView() {
        let ButtonView = UIStackView(arrangedSubviews:[titleButton,bodyButton])
        
        ButtonView.axis = .horizontal
        ButtonView.spacing = 8
        view.addSubview(ButtonView)
        ButtonView.translatesAutoresizingMaskIntoConstraints = false
        ButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        ButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -300).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLabels()
        setUpButtons()
        setUpStackView()
        setUpButtonView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector((handleTapAnimations))))
        titleButton.addTarget(self, action: #selector(okFadeButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleTapAnimations(){
        print("Animating")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                //                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -150)
                
            }){ (_) in
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 100, y: 30)
                })
            }
        }
    }
    @objc fileprivate func okFadeButton(){
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: 100, y: 30)
//            self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: -100, y: -30)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: -100, y: -30)
            })
        }
    }
     @objc fileprivate func okFadeButton2(){
            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: 100, y: 30)
    //            self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: -100, y: -30)
            }) { (_) in
                
                UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    self.bodyButton.transform = self.bodyButton.transform.translatedBy(x: -100, y: -30)
                })
            }
        }
}
