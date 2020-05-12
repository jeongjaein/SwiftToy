//
//  MVVMEx.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/12.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

class MVVMEx: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var myTableView = UITableView()
    var data = [
        Person(firstName: "youngchan", lastName: "Ko", gender: "Male", age: 25, height: 183),
        Person(firstName: "geonnyun", lastName: "Kim", gender: "Male", age: 25, height: 185),
        Person(firstName: "jaein", lastName: "jeong", gender: "Male", age: 25, height: 170)
    ]
    
    func createTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    //numberofRowsInsection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        let model = data[indexPath.row]
        let viewModel = CellViewModel(firstName: model.firstName, lastName: model.lastName, gender: model.gender)
        cell.textLabel?.text = "\(viewModel.firstName)  \(viewModel.lastName)"
        return cell
    }
    //didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
    
}

struct  CellViewModel {
    let firstName: String
    let lastName: String
    let gender: String
}