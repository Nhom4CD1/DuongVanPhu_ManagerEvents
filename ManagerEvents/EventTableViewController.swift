//
//  EventTableViewController.swift
//  ManagementEvent
//
//  Copyright © 2017 DVP. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {
    
    
    var eventList = EventList()
    
    let cellId = "eventCellId"
    var indexPathSelected: IndexPath = []
    var searchBarController = UISearchController(searchResultsController: nil)
    
    var filterEvent = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation button item to switch edit mode [edit]
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        searchBarController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchBarController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchBarController.searchBar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return EventList.eventtList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EventList.eventtList[section].events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EventCell
        
        cell.titleLabel.text = EventList.eventtList[indexPath.section].events[indexPath.row].title
        cell.subLabel.text = EventList.eventtList[indexPath.section].events[indexPath.row].content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return EventList.eventtList[section].weekdays
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (UITableViewRowAction, IndexPath) in
            EventList.deleteEventInDay(weekday: indexPath.section, indexOfEvent: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [deleteAction]
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        sortEvent(moveRowAt: fromIndexPath, to: to)
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    /// move an event to other position
    ///
    /// - Parameters:
    ///   - fromIndexPath: index of row when user tap on move button of cell (edit mode)
    ///   - to: index destination when user drag cell (edit mode)
    func sortEvent(moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let eventTemp = EventList.eventtList[fromIndexPath.section].events[fromIndexPath.row]
        EventList.deleteEventInDay(weekday: fromIndexPath.section, indexOfEvent: fromIndexPath.row)
        EventList.eventtList[to.section].events.insert(eventTemp, at: to.row)
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        indexPathSelected = indexPath
        return indexPath
    }
    
    
    // send data to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dectination = segue.destination as! DetailViewController
            dectination.section = indexPathSelected.section
            dectination.row = indexPathSelected.row
        }
        
    }
    
    func filterContentForSearchText(searchText: String) {
        
    }
    
}
