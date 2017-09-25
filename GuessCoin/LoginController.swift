//
//  ViewController.swift
//  GuessCoin
//
//  Created by Eremenko on 25.09.17.
//  Copyright © 2017 GuessCoin. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let url = "https://app.guesscoin.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        error.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toMain(sender : UIButton){
        login(callback: { result in
            error.isHidden = (result == 1) ?  true  : false
            if (result == 1) {
                performSegue(withIdentifier: "toList",sender:self)
            }
        })
    }
    
    @IBAction func toRegistration(sender : UIButton){
        performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    func login(callback:  (_ result: Int) -> Void) {
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

