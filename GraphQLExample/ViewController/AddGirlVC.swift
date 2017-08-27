//
//  AddGirlVC.swift
//  GraphQLExample
//
//  Created by Thanh-Dung Nguyen on 8/20/17.
//  Copyright © 2017 Thanh-Dung Nguyen. All rights reserved.
//

import UIKit

protocol AddGirlDelegate: class {
    func addGirl(name: String, age: Int, height: Double)
    func update(girl: GirlFullDetails)
}

enum UpdateMode {
    case add
    case edit
}

class AddGirlVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    weak var delegate: AddGirlDelegate?
    
    var girl: GirlFullDetails?
    var mode: UpdateMode!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if mode == .edit {
            nameTextField.text = girl?.name
            ageTextField.text = String(describing: girl!.age)
            heightTextField.text = String(describing: girl!.height)
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        if self.mode == .add {
            self.delegate?.addGirl(name: self.nameTextField.text!, age: Int(self.ageTextField.text!)!, height: Double(self.heightTextField.text!)!)
            
            self.dismiss(animated: true, completion: nil)
        } else {
            girl?.name = self.nameTextField.text!
            girl?.age = Int(self.ageTextField.text!)!
            girl?.height = Double(self.heightTextField.text!)!
            self.delegate?.update(girl: self.girl!)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
    }
}
