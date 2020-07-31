//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Raju Gupta on 16/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        persons = DBManager.share.fetchData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(persons[indexPath.row].name!) \(persons[indexPath.row].age!)"
        cell.detailTextLabel?.text = persons[indexPath.row].address
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            let context = DBManager.share.context
            context.delete(persons[indexPath.row])
            DBManager.share.saveContext()
            
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "AddPersonViewController") as! AddPersonViewController
        vc.btnTitle = "Update"
        vc.singlePerson = persons[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

