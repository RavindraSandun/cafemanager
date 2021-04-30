//
//  RegisterViewController.swift
//  Ravindra_Sandun-COBSCCOMP192P-054
//
//  Created by Sandun on 4/30/21.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    
    @IBAction func didTappedOnRegister(_ sender: Any) {
        
        if emailTF.text == ""{
            let alertshow = UIAlertController(title: "ERROR", message: "Please  enter email", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertshow.addAction(ok)
            self.present(alertshow, animated: true)
        }else if mobileTF.text == ""{
            let alertshow = UIAlertController(title: "ERROR", message: "Please enter mobile number", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertshow.addAction(ok)
            self.present(alertshow, animated: true)
        }else if passwordTF.text == ""{
            let alertshow = UIAlertController(title: "ERROR", message: "Please enter Password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertshow.addAction(ok)
            self.present(alertshow, animated: true)
        }else{
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { authResult, error in
            if let user = authResult?.user {
                UserDefaults.standard.set(user.uid, forKey: "userId")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homesection") as! UITabBarController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
            else
            {
                let alertshow = UIAlertController(title: "ERROR", message: "Invalid UserName Password", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                })
                alertshow.addAction(ok)
                self.present(alertshow, animated: true)
            }
        }
    }
    }
}
