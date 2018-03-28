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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FactCellReuseIdentifier", for: indexPath) as! FactTableViewCell
        cell = customizeCell(cell: cell)
        return cell
    }
    
    func customizeCell(cell : FactTableViewCell) -> (FactTableViewCell) {
        cell.titleLabel.text = "Test Title"
        cell.descriptionLabel.text = "Test Description"
        cell.factImageView.image = UIImage(named: "placeholder")
        return cell
    }
    
}
