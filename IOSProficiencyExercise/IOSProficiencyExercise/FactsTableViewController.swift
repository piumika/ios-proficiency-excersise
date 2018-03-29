//
//  FactsTableViewController.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 28/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import UIKit

/*
 CustomTableViewController that is used for displaying the facts 
 */

class FactsTableViewController: UITableViewController {
    
    var facts: [Fact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFactsDataAndPopulateUI(isRefresh: false)
        customizeTableView()
        createRefreshController()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.facts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FactCellReuseIdentifier", for: indexPath) as! FactTableViewCell
        cell = customizeCell(cell: cell, atIndexPath:indexPath)
        return cell
    }
    
    // MARK: - Helper Methods
    
    func customizeCell(cell : FactTableViewCell, atIndexPath indexPath : IndexPath) -> (FactTableViewCell) {
        let fact =  self.facts[indexPath.row]
        cell.titleLabel.text = fact.title
        
        cell.factImageView.image = UIImage(named: "placeholder")
        cell.descriptionLabel.text = nil
        
        if let description = fact.description {
            cell.descriptionLabel.sizeToFit()
            cell.descriptionLabel.text = description
        }
        
        if let imageUrl =  fact.imageHref {
            cell.factImageView.downloadImageFrom(link: imageUrl, contentMode: UIViewContentMode.scaleAspectFit)
        }
        return cell
    }
    
    func  customizeTableView() ->Void {
        self.tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func fetchFactsDataAndPopulateUI(isRefresh : Bool) -> Void {
        FactsService().getResults() {
            (result: FactsRoot?) in
            
            var facts : [Fact] = []
            var title = ""
            if let factsResult = result
            {
                facts = factsResult.rows
                title = factsResult.title
                
            }
            
            DispatchQueue.main.async {
                
                self.setNavigationBarTitle(title: title)
                self.populateTableView(facts: facts)
                
                if let refreshControl = self.refreshControl , isRefresh
                {
                    refreshControl.endRefreshing()
                }
                
            }
        }
    }
    
    func setNavigationBarTitle(title : String) -> Void {
        self.title = title
    }
    
    func populateTableView(facts : [Fact]) -> Void {
        self.facts = facts
        self.tableView.reloadData()
        
    }
    
    func createRefreshController() -> Void {
        refreshControl = UIRefreshControl()
        
        if let refreshControl = refreshControl {
            refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            
        }
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        
        fetchFactsDataAndPopulateUI(isRefresh: true)
    }
    
}
