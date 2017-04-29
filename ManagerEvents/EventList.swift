//
//  EventList.swift
//  ManagementEvent
//
//  Created by PhongLe on 4/22/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class EventList {
    
    private var weekdays = ["Sunday","Monday","Tueday","Wednesday","Thursday","Friday","Saturday"]
    
    /// một mảng chứa sự kiện của các ngày trong tuần, mỗi ngày chứa một mảng các Event, mỗi Event có title và content
    static var eventtList:[(weekdays: String, events: Array<Event>)] = []
    
    /// khi khơi tạo list sẽ tạo ra một mãng dữ liệu sẵn (nhìn có vẻ giống random mỗi khi tắt app mở lại)
    init() {
        for day in weekdays {
            EventList.eventtList.append((weekdays: day,
                                         events: {
                                            var event: [Event]=[]
                                            for i in 0 ... 5 {
                                                let randomNum : Int = Int(arc4random() % 3 + 2)
                                                
                                                if i == randomNum { //tạo cảm giác ngẫu nhiên số lượng event của các ngày
                                                    break
                                                }
                                                let title = "Tên sự kiện \(i) in \(weekdays[weekdays.index(of: day)!])"
                                                let content = "Nội dung Sự kiện \(i) in \(weekdays[weekdays.index(of: day)!])"
                                                event.append(Event(title: title, content: content))
                                            }
                                            return event
            }()
            ))
        }
    }
    
    
    /// delete an event in day
    ///
    /// - Parameters:
    ///   - weekday: index of this day in weekdays
    ///   - indexOfEvent: index of event in day
    static func deleteEventInDay(weekday: Int,indexOfEvent: Int){
        EventList.eventtList[weekday].events.remove(at: indexOfEvent)
    }
    
}
