//
//  RegistrationController.swift
//  GuessCoin
//
//  Created by Eremenko on 25.09.17.
//  Copyright © 2017 GuessCoin. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        error.isHidden = true
    }
    
    @IBAction func register(sender: UIButton){
        tryRegister(callback: {result in
            error.isHidden = (result==1) ? true : false
            if (result==1){
                performSegue(withIdentifier: "toList",sender:self)
            }
        })
    }
    
    func tryRegister(callback:  (_ result: Int) -> Void) {
        guard let login = login.text else {
            callback(0)
            return
        }
        guard let password = password.text else {
            callback(0)
            return
        }
        if ((login.characters.count > 0) && (password.characters.count > 0)){
            callback(1) // good try
        } else {
            callback(0) // wrong try
        }
    }
}

