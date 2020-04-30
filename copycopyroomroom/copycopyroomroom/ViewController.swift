//
//  ViewController.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/03/12.
//

import UIKit


class ViewController : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //탭바생성
        
        
        let userNav = generateNavController(vc: UserViewController(), title: "친구목록", image : UIImage(named: "user.png")!)
        let meetingListNav = generateNavController(vc: MeetingListViewController(), title: "약속목록", image:UIImage(named: "list.png")!)
        let alarmNav = generateNavController(vc: AlarmViewController(), title: "알림", image: UIImage(named: "list.png")!)
        let otherNav = generateNavController(vc: OtherViewController(), title: "더보기", image:UIImage(named: "setting.png")!)
        UINavigationBar.appearance()
        
        viewControllers = [userNav,meetingListNav,alarmNav,otherNav]
    }
    
    func generateNavController(vc : UIViewController, title: String, image: UIImage) -> UINavigationController{
        
        let navController = UINavigationController(rootViewController: vc)
        
        navController.tabBarItem.image = image
        
        navController.title = title
        return navController
    }
}
