//
//  NotificationEx.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/13.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

class NotificationEx: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        NotificationCenter.default.addObserver(self, selector: #selector(dataDownloaded(n:)), name: NSNotification.Name.init(rawValue: "DataDownloaded"), object: nil)
    }
    func createButton() {
        
        let notiButton = UIButton()
        notiButton.setTitle("MVVM", for: .normal)
        notiButton.setTitleColor(UIColor.gray, for: .normal)
        notiButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        notiButton.backgroundColor = .white
        self.view.addSubview(notiButton)
        notiButton.addTarget(self, action: #selector(dataDownloaded), for: .touchUpInside)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func dataDownloaded(n:NSNotification){
        print("triggered")
    }
}
