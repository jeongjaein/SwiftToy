//
//  MeetingListViewController.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/03/12.
//

import UIKit
import Foundation
import _SwiftUIKitOverlayShims


class MeetingListViewController : UIViewController{
    let myTableView : UITableView = {
        
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView}()
    
    
    struct Cells {
        static let profileCell = "MeetingTableViewCell"
    }
    var testman : [UserProfile] = [UserProfile(name: "testman", UIImage: UIImage(named: "setting.png")!)]
    
    var testMeeting : [MeetingInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        for i in 1...3{
            testMeeting.append(MeetingInfo(MeetingTitle: "스타벅스\(i)", MeetingDay: "2020-03-29", MeetingTime: "18 : 00", MeetingPlace: "홍대입구역"))
        }
        
        self.myTableView.tableFooterView = UIView(frame: .zero)
        self.myTableView.dataSource = self
        self.myTableView.register(MeetingTableViewCell.self,forCellReuseIdentifier: Cells.profileCell) // 이걸해서 오류해결됨 스토리보드 어쩌고
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.view.addSubview(self.myTableView)
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false //이게 아마 레이아웃 내가 정할테니 신경끄라는 코드
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
        
       
        
        
        let test = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
        self.navigationItem.rightBarButtonItem = test
        
        let toIndicateButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toIndicateAction))
        //        self.navigationItem.rightBarButtonItem = test
                self.navigationItem.leftBarButtonItem = toIndicateButton

    }
    
    
    @objc func buttonAction() {
        let makeMeetingViewController = MakeMeetingViewController()
        makeMeetingViewController.sendDelegate = self
        let navigation = UINavigationController(rootViewController: makeMeetingViewController)
        self.navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    @objc func toIndicateAction() {
            let indicatorEx = IndicatorEx()
    //        makeMeetingViewController.sendDelegate = self
    //        let navigation = UINavigationController(rootViewController: indicatorEx)
            indicatorEx.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(indicatorEx, animated: true, completion: nil)
        }

}
extension MeetingListViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testMeeting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: Cells.profileCell, for: indexPath) as! MeetingTableViewCell
        
        print("check")
        
        cell.set(meetingInfo: testMeeting[indexPath.row])
        return cell
    }

    
    
}
extension MeetingListViewController : UITableViewDelegate{
    
    
    //셀 클릭시 해당 셀 제어하는 부분
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(testMeeting[indexPath.row])
        
        self.present(FindUserViewContrller(), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}


extension MeetingListViewController : sendTextDelegate{
    func sendText(data: String){
        testMeeting.append(MeetingInfo(MeetingTitle: data, MeetingDay: data, MeetingTime: data, MeetingPlace: data))
        myTableView.reloadData()
    }
    
}
