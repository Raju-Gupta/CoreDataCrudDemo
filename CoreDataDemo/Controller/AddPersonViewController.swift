//
//  AddPersonViewController.swift
//  CoreDataDemo
//
//  Created by Raju Gupta on 16/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtAge : UITextField!
    @IBOutlet weak var txtAddress : UITextField!
    @IBOutlet weak var btn : UIButton!
    
    var singlePerson : Person?
    var btnTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if singlePerson?.name != nil{
            self.title = btnTitle
            txtName.text = singlePerson?.name
            txtAge.text = singlePerson?.age
            txtAddress.text = singlePerson?.address
            btn.setTitle(btnTitle, for: .normal)
        }
    }
    
    @IBAction func onClickAdd(_ sender: UIButton){
        
        guard let name = txtName.text, let age = txtAge.text, let address = txtAddress.text else{return}
        
        if singlePerson?.name != nil{
            singlePerson?.name = name
            singlePerson?.age = age
            singlePerson?.address = address
            
            DBManager.share.saveContext()
            navigationController?.popViewController(animated: true)
        }
        else{
            
            let person = Person(context: DBManager.share.context)
            person.name = name
            person.address = address
            person.age = age
            
            DBManager.share.saveContext()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
