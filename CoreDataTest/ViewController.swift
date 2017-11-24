//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Ernie Cho on 11/16/17.
//  Copyright © 2017 ErnShu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let person  = people[indexPath.row]
        cell?.textLabel!.text = person.value(forKey: "name") as? String
        return cell!
    }
    @IBAction func addName(_ sender: AnyObject) {
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {(action: UIAlertAction!) -> Void in
        
        let textField = alert.textFields![0] as UITextField;
            self.saveName(name: textField.text!)
        self.tableView.reloadData()
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {(action: UIAlertAction!) -> Void in
        }
        alert.addTextField { (textField: UITextField!) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveName(name: String){
       //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        //2
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        //3
        person.setValue(name, forKey: "name")
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            print("Could not save \(error!), \(String(describing: error?.userInfo))");
        }
        //5
        people.append(person)
    }
}

