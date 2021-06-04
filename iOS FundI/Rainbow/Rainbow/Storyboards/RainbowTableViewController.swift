//
//  RainbowTableViewController.swift
//  Rainbow
//
//  Created by Areum Jo on 3/10/21.
//

import UIKit

class RainbowTableViewController: UITableViewController {
    
    var colors: [MyColor] = [MyColor(name: "Red", color: .red),
                             MyColor(name: "Orange", color: .orange),
                             MyColor(name: "Yellow", color: .yellow),
                             MyColor(name: "Green", color: .green),
                             MyColor(name: "Blue", color: .blue),
                             MyColor(name: "Cyan", color: .cyan),
                             MyColor(name: "Purple", color: .purple)]


    // MARK: - Table view data source

    // Can you tell me what information I need to display? -Table View
        // at default, it will return 0 so the simulator won't show any rows
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count // want as many as rows for the # of data (list)
    }

    // How should the cells look? (cell style) attribute inspector from the storyboard : "reuseIdentifier"
    
    // IndexPath : x = section, y = row (here only 1 section)
    // 1st row of a tableview (0,0) -> (0,1) -> (0,2)
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)

        // Configure the cell...
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.name
        cell.backgroundColor = color.color
        
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // make sure you are using the correct segue (the exact segue identifier from the stroyboard)
        if segue.identifier == "ShowColorDetail" {
            // Get the new view controller using segue.destination.
            let detailVC = segue.destination as? ColorDetailViewController
            
            // Get the information you want to pass to the new view controller
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let color = colors[indexPath.row]
                
                // Pass the selected object to the new view controller.
                detailVC?.color = color
            }
        }
    }
}
