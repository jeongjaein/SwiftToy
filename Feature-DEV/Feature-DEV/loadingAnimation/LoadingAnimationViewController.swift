//
//  NavigationTitleAnimationViewController.swift
//  Feature-DEV
//
//  Created by 정재인 on 2020/07/07.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoadingAnimationViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5);
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor(named: "default")
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.white
        activityIndicator.stopAnimating()
        return activityIndicator
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
//        self.activityIndicator.stopAnimating()
    }
}
