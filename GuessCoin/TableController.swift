//
//  TableController.swift
//  GuessCoin
//
//  Created by Eremenko on 25.09.17.
//  Copyright © 2017 GuessCoin. All rights reserved.
//

import UIKit

class TableController: UIViewController {
    
    var names:[String] = ["Cat's","Dog's"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TableController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            cell.textLabel?.text = names[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
}

extension TableController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGuess", sender: self)
    }
}
