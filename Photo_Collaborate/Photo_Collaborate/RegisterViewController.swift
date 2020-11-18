//
//  RegisterViewController.swift
//  Photo_Collaborate
//
//  Created by Mohammed Othman on 11/15/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    
   
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.text = ""
        lastNameField.text = ""
        usernameField.text = ""
        passwordField.text = ""

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        
        // user.setObject(firstNameField.text as Any, forKey: "first name")
        // user.setObject(lastNameField.text as Any, forKey: "last name")
        user.username = usernameField.text! as String
        user.password = passwordField.text! as String
      
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Username is : \(String(describing: user.username))  Password is : \(String(describing: user.password))")
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
