//
//  BondListViewController.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Interfaces

class BondListViewController : UITableViewController {
    
    var bonds : [Bond]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    private func loadData() {
        guard let provider = self.provider(by: BondProvider.self) else {
            fatalError("BondProvider is uninitialized!")
        }
        provider.bonds { [weak self] bonds in
            // TODO: write test to ensure completion on the main thread
            self?.bonds = bonds
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bonds?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BondListReuseID") else {
            fatalError("unable to dequeue cell with id: BondListReuseID")
        }
        cell.textLabel?.text = self.bonds?[indexPath.row].identifier ?? "empty"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? BondDataViewController {
            detailsVC.bond = self.bonds?[self.tableView.indexPathForSelectedRow?.row ?? 0]
        }
    }
    
}
