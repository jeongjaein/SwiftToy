//
//  CustomTableViewCell.swift
//  MVVMToy
//
//  Created by 정재인 on 2020/05/13.
//  Copyright © 2020 정재인. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    static let cellIdentifier = "CustomTableViewCell"
    var myLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(myLabel)
        myLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel){
        myLabel.text = "\(viewModel.firstName)  \(viewModel.lastName)"
    }
}

