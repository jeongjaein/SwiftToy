//
//  MVVMExViewController.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/12.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

class MVVMExViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var viewModel: MVVMExampleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        if let viewModel = viewModel {
            viewModel.helloText.bind({ (helloText) in
                DispatchQueue.main.async {
                    // When value of the helloText Dynamic variable
                    // is set or changed in the ViewModel, this code will
                    // be executed
                    self.helloLabel.text = helloText
                }
            })
        }
    }
    
    @IBAction func sayHelloButtonPressed(_ sender: UIButton) {
        viewModel?.userTriggeredSayHelloButton()
    }
}
