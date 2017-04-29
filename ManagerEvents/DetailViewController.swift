//
//  DetailViewController.swift
//  ManagementEvent
//
//  Copyright © 2017 DVP. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTextView: UITextView!
    @IBOutlet weak var txt: UITextField!
    var section = 0
    var row = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ChiTiet"
        print("selected: section \(section), row \(row)")
        titleTextField.text = EventList.eventtList[section].events[row].title
        subTextView.text = EventList.eventtList[section].events[row].content
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
