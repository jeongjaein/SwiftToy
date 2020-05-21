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
            .single()
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            //옵저브온 밑에 친구들은 메인이아닌곳에서 돌아감
            //qos는 우선순위, background이렇게하면 제일 낮은 뭐 그런느낌??
            .map{ $0.replacingOccurrences(of: "x", with: "/") }
            .map{ "https://picsum.photos/\($0)/?random" }
            .map{ URL(string: $0) }
            .filter{ $0 != nil }
            .map{ $0! }
            .map{ try Data(contentsOf:  $0) }
            .map{ UIImage(data: $0) }
//            .subscribeOn(MainScheduler.instance)
//            이 구문은 오퍼레이터들의 구문이 서브스크라이브를 들어가는 순간 실행 되는 걸로써 아무데나 있어도 됨
            .do(onNext: {image in
                print(image?.size)
            })//do는 어떤 그위의 오퍼레이터들이 실행되는 그 흐름상에서 언젠가한번 실행되는 그런느낌?
            .observeOn(MainScheduler.instance)
            //요밑부터는 메인
            .subscribe(onNext: { image in
                self.imageView.image = image//밖에있는 이미지뷰에 하는 작업이여서 sideeffect임
            }, onError: {err in
                print(err.localizedDescription)
            })//에러만 따로 추가한거
            .disposed(by: disposeBag)
    }
}
