//
//  UserViewController.swift
//  Practice
//
//  Created by 정재인 on 2020/03/21.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit


protocol ProfilePassDelegate{
    func profilePass(name : String,Image : UIImage)
}


class UserViewController : UIViewController{
    //디테일뷰로 보낼 델리게이트 생성
    var delegate: ProfilePassDelegate?
    var detailView = ProfileDetailViewController()
    
    //테이블뷰 생성
    let myTableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //검색창 객체 생성
    let searchController = UISearchController(searchResultsController: nil)
    
    //각셀들에 뿌려질 유저프로필 데이터배열 형식은 UserProfile
    var items:[UserProfile] = []
    
    //검색창에서 검색한 텍스트를 필터로 걸러진 데이터들을 담아 뿌려줄 배열 마찬가지로 형식은 UserProfile
    var searchResults : [UserProfile] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...20{
            items.append(UserProfile(name: "USER\(i)", UIImage: UIImage(named: "Image-\(i).png")!))//왜느낌푠지랑, 이미지 이름넣는거 함수짜기
            //없는 이미지파일을 만드려하면 오류가 납니다.Unexpectedly found nil while unwrapping an Optional value: file 라고 
        }
        
        //검색바 앞에 이미지를 내가 커스텀
        searchController.searchBar.setImage(UIImage(named: "user.png"), for: .search, state: .normal)
        // 1. 검색 결과는 동일한 table view controller에 결과를 보여준다
        searchController.searchResultsUpdater = self
        // 2. 검색컨트롤러는 검색하는 동안 네비게이션바에 가려지지않도록한다
        searchController.hidesNavigationBarDuringPresentation = false
        // 3. 검색컨트롤러의 사이즈를 화면에 맞도록 설정
        searchController.searchBar.sizeToFit()
        // 4. 검색 컨트롤러는 테이블의 Header에 위치시킨다
        //        self.myTableView.tableHeaderView = ""
        //여기 "" 부분에 내 프로필 넣으면 될듯
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "친구 검색"
        //네이게이션 바에 검색창 달기
        navigationItem.titleView = searchController.searchBar
        //스와이프하면 없어졌다가 생기는거
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "test"
        //이건머지
        self.definesPresentationContext = true
        //테이블 뷰 하단에 빈셀 표시 막기
        self.myTableView.tableFooterView = UIView(frame: .zero)
        //이건멀까
        self.myTableView.dataSource = self
        self.myTableView.register(UserTableViewCell.self,forCellReuseIdentifier: "UserTableViewCell")
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false //이게 아마 레이아웃 내가 정할테니 신경끄라는 코드,테이블뷰를 생성할때 써도됨
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
    }
    
    
}




extension UserViewController : UITableViewDataSource{
    // 테이블뷰에 보여줄 데이터의 갯수
    // 검색컨트롤러가 활성화되면 필터된 데이터의 갯수, 비활성화라면 원본 데이터의 갯수를 리턴한다
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive{
            return searchResults.count
        }else{
            return items.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        if searchController.isActive{
            cell.imageView!.image = searchResults[indexPath.row].UIImage
            cell.textLabel?.text = searchResults[indexPath.row].name
        }else{
            cell.imageView!.image = items[indexPath.row].UIImage
            cell.textLabel?.text = items[indexPath.row].name
        }
        return cell
    }
    //    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //}//UISwipeActionsConfiguration은 Table Row를 스와이프 할 때 수행 할 작업 집합(Set)
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:  "차단", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
        })
        //            return UISwipeActionsConfiguration(actions:[deleteAction,shareAction])
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
    //UISwipeActionsConfiguration은 Table Row를 스와이프 할 때 수행 할 작업 집합(Set)
}


extension UserViewController : UITableViewDelegate{
    //각셀 클릭시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popupVC = ProfileDetailViewController()
        popupVC.profilePass(name: items[indexPath.row].name, Image: items[indexPath.row].UIImage)
        self.definesPresentationContext = true
        //overFullScreen으로 해야 다 가려지면서 alpha값 조정 가능 그냥 FullScreen 아님 //currentcontext 는 탭바랑 네비게이션바 못가림
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        self.present(popupVC, animated: true, completion: nil)
    }
}
extension UserViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if(searchController.searchBar.text?.count)!>0{
            searchResults.removeAll(keepingCapacity: false)
            searchResults = items.filter { $0.name.localizedCaseInsensitiveContains(searchController.searchBar.text!) } //이건ts이런식으로 쳐도 test가 나옴
            //searchResults = items.filter { $0.name.localizedStandardContains(searchController.searchBar.text!) }//이건 순서대로 쳐야 나옴 뭘로할지는 고민고민
            myTableView.reloadData()
        }else{
            searchResults.removeAll(keepingCapacity: false)
            searchResults = items
            myTableView.reloadData()
        }
    }
}
