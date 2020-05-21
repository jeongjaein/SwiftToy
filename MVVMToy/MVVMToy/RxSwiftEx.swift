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
    var justButton = UIButton()
    var fromButton = UIButton()
    var mapButton = UIButton()
    var map2Button = UIButton()
    var imageView = UIImageView()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        createJustButton()
        createFromButton()
        createMapButton()
        createMapWithSchedulerButton()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "test")
        
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: map2Button.bottomAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
    func createJustButton() {
        justButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        justButton.setTitle("just1", for: .normal)
        justButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(justButton)
        justButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        justButton.addTarget(self, action: #selector(justButtonAction), for: .touchUpInside)
    }
    func createFromButton() {
        fromButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        fromButton.setTitle("From1", for: .normal)
        fromButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fromButton)
        fromButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fromButton.topAnchor.constraint(equalTo: justButton.bottomAnchor, constant: 0).isActive = true
        fromButton.addTarget(self, action: #selector(fromButtonAction), for: .touchUpInside)
    }
    func createMapButton(){
        mapButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        mapButton.setTitle("Map1", for: .normal)
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapButton)
        mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapButton.topAnchor.constraint(equalTo: fromButton.bottomAnchor, constant: 0).isActive = true
        mapButton.addTarget(self, action: #selector(mapButtonAction), for: .touchUpInside)
    }
    func createMapWithSchedulerButton() {
        map2Button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        map2Button.setTitle("map with scheduler", for: .normal)
        map2Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map2Button)
        map2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        map2Button.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 0).isActive = true
        map2Button.addTarget(self, action: #selector(map2ButtonAction), for: .touchUpInside)
    }
    @objc func justButtonAction(){
        Observable.just("just test!")
            .subscribe{ event in
                switch event {
                case .next(let str):
                    print(str)
                    break
                case .error( _):
                    break
                case .completed:
                    break
                }
        }
        .disposed(by: disposeBag)
    }
    @objc func fromButtonAction(){
        Observable.from(["from1","from2","from3"])
            //            .single() //use single for error test!
            .subscribe{ event in
                switch event {
                case .next(let str):
                    print("nest: \(str)")
                    break
                case .error(let err):
                    print("error: \(err.localizedDescription)")
                    break
                case .completed:
                    print("complited")
                    break
                }
        }
        .disposed(by: disposeBag)
    }
    @objc func mapButtonAction(){
        Observable.from(["첫번째문자열","두우번째문자열"])
            .map{ $0.count}
            .subscribe(onNext:{ str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    @objc func map2ButtonAction(){ 
        Observable.just("800x600")
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            //옵저브온 밑에 친구들은 메인이아닌곳에서 돌아감
            .map{ $0.replacingOccurrences(of: "x", with: "/") }
            .map{ "https://picsum.photos/\($0)/?random" }
            .map{ URL(string: $0) }
            .filter{ $0 != nil }
            .map{ $0! }
            .map{ try Data(contentsOf:  $0) }
            .map{ UIImage(data: $0) }
            .observeOn(MainScheduler.instance)
            //요밑부터는 메인
            .subscribe(onNext: { image in
                self.imageView.image = image
            })
            .disposed(by: disposeBag)
    }
}








//override func viewDidLoad(){
//        super.viewDidLoad()
//        //        view.backgroundColor = .black
//
//
//        imageView.backgroundColor = .red
//        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
////        imageView.translatesAutoresizingMaskIntoConstraints = false
////        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        countLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
//
//        view.addSubview(countLabel)
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
//            self.counter += 1
//            self.countLabel.text = "\(self.counter)"
//        }
//
//
//
//    }

//func onLoadImage(_ sender: Any){
//        imageView.image = nil
//        _ = rxswiftLoadImage(from: "https://s2js.com/img/etc/watermelon2.png")
//            .observeOn(MainScheduler.instance)
//            .subscribe({ result in
//                switch result {
//                case let .next(image):
//                    self.imageView.image = image
//                case let .error(err):
//                    print(err.localizedDescription)
//                case .completed:
//                    break
//                }
//            })
//    }
//
//    func rxswiftLoadImage(from imageUrl: String) -> Observable<UIImage?>{
//        return Observable.create { seal in
//            self.asyncLoadImage(from: imageUrl){ image in
//                seal.onNext(image)
//                seal.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
//
//    func asyncLoadImage(from imageUrl: String, completed: @escaping (UIImage?) -> Void){
//        DispatchQueue.global().async{
//            guard let url = URL(string: imageUrl) else {
//                completed(nil)
//                return
//            }
//            guard let data = try? Data(contentsOf: url) else {
//                completed(nil)
//                return
//            }
//
//            let image = UIImage(data: data)
//            completed(image)
//        }
//    }
