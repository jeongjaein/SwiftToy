//
//  RxSwiftEx.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/18.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit
import RxSwift
class RxSwiftEx: UIViewController{
    var counter: Int = 0
    var imageView = UIImageView()
    var countLabel = UILabel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
//        view.backgroundColor = .black
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            self.counter += 1
            self.countLabel.text = "\(self.counter)"
        }
        view.addSubview(imageView)
        view.addSubview(countLabel)
    }
    
   
    
    func onLoadImage(_ sender: Any){
        imageView.image = nil
        _ = rxswiftLoadImage(from: "https://s2js.com/img/etc/watermelon2.png")
            .observeOn(MainScheduler.instance)
            .subscribe({ result in
                switch result {
                case let .next(image):
                    self.imageView.image = image
                case let .error(err):
                    print(err.localizedDescription)
                case .completed:
                    break
                }
            })
    }
    
    func rxswiftLoadImage(from imageUrl: String) -> Observable<UIImage?>{
        return Observable.create { seal in
            self.asyncLoadImage(from: imageUrl){ image in
                seal.onNext(image)
                seal.onCompleted()
                }
            return Disposables.create()
        }
    }
    
    func asyncLoadImage(from imageUrl: String, completed: @escaping (UIImage?) -> Void){
        DispatchQueue.global().async{
            guard let url = URL(string: imageUrl) else {
                completed(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completed(nil)
                return
            }
            
            let image = UIImage(data: data)
            completed(image)
        }
    }
}