//
//  ShowImageTable.swift
//  SnapchatClone
//
//  Created by Anita Shen on 2/23/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit

extension ShowImageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSnaps.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
    
    /// Returns the table view cell with pokemon and info
    ///
    /// - Parameters:
    ///   - tableView: table view
    ///   - indexPath: index of cell
    /// - Returns: table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath as IndexPath) as! FeedTableViewCell
        
        let event = all_events[indexPath.row]
        cell.eventDate.text = event.date
        cell.eventName.text = event.name
        cell.eventTime.text = event.time
        
        cell.eventImage?.image = event.image
        
        // Initialize Cell
        cell.awakeFromNib()
        
        print("creating cell with event name \(event.name)")
        
        print("and image \(event.image)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedEvent = eventsList[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toDetails", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func reload(tableView: UITableView) {
        //        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        //        tableView.setContentOffset(contentOffset, animated: false)
        
    }
    
    
}

