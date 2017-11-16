//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Ernie Cho on 11/16/17.
//  Copyright © 2017 ErnShu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        return cell
    }
    @IBAction func addName(_ sender: AnyObject) {
        _ = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        _ = UIAlertAction(title: "Save", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
        
        let textField = alert?.textField![0] as! UITextField
        self.names.append(textField.text)
        self.tableView.reloadData()
    }
}

