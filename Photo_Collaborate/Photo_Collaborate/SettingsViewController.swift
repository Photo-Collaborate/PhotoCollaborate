//
//  SettingsViewController.swift
//  Photo_Collaborate
//
//  Created by Mohammed Othman on 11/19/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = PFUser.current()?.username
        // Do any additional setup after loading the view.
    }
    
    func logoutUser() -> Void {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = loginViewController
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        logoutUser()
    }
    
    @IBAction func changePassword(_ sender: Any) {
        let email = PFUser.current()?.email!
        
        PFUser.requestPasswordResetForEmail(inBackground: email!) { (success, error) in
            if(error != nil){
                print("Error trying to reset password")
            } else {
                print("Email sent to user")
                
                let dialogMessage = UIAlertController(title: "Reset Password", message: "An email has been sent to reset your password", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                    print("Alert dismissed")
                }
                
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func deleteAccount(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account? This is permanent and cannot be undone.", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
            PFUser.current()?.deleteInBackground(block: { (success, error) in
                print("Account deleted")
                self.logoutUser()
            })
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
            print("Canceled delete account")
        }
        
        dialogMessage.addAction(yes)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
//        PFUser.current()?.setObject(file!, forKey: "profileImage")
    
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
