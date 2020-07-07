//
//  MeetingTableViewCell.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/03/29.
//

import UIKit

class MeetingTableViewCell : UITableViewCell {

    var MeetingTitle = UILabel()
    var MeetingDay = UILabel()       //날짜타입
    var MeetingTime = UILabel()   //시간타입
    var MeetingPlace = UILabel()   //일단은 스트링으로
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(MeetingTitle)
        addSubview(MeetingDay)
        addSubview(MeetingTime)
        addSubview(MeetingPlace)
        MeetingListLayoutSet()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set(meetingInfo: MeetingInfo){
        MeetingTitle.text = meetingInfo.MeetingTitle
        MeetingDay.text = meetingInfo.MeetingDay
        MeetingTime.text = meetingInfo.MeetingTime
        MeetingPlace.text = meetingInfo.MeetingPlace
    }
    func MeetingListLayoutSet(){
        MeetingTitle.translatesAutoresizingMaskIntoConstraints = false
        MeetingTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = false
        MeetingTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        MeetingTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        MeetingTitle.font = UIFont(name:"Apple Color Emoji" , size: 20)
        MeetingDay.translatesAutoresizingMaskIntoConstraints =  false
        MeetingDay.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        MeetingDay.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        MeetingTime.translatesAutoresizingMaskIntoConstraints =  false
        MeetingTime.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        MeetingTime.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
        MeetingTime.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true

        MeetingPlace.translatesAutoresizingMaskIntoConstraints =  false
        MeetingPlace.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        MeetingPlace.leadingAnchor.constraint(equalTo : leadingAnchor, constant : 200).isActive = true
        
    }
    
    
}
