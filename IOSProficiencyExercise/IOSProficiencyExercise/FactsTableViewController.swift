//
//  FactsTableViewController.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 28/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import UIKit

class FactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FactCellReuseIdentifier", for: indexPath) as! FactTableViewCell
        cell = customizeCell(cell: cell)
        return cell
    }
    
    func customizeCell(cell : FactTableViewCell) -> (FactTableViewCell) {
        cell.titleLabel.text = "Test Title"
        cell.descriptionLabel.text = "A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you."
        cell.factImageView.image = UIImage(named: "placeholder")
        return cell
    }
    
}
