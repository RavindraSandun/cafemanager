

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        if emailTF.text == ""{
            let alertshow = UIAlertController(title: "ERROR", message: "Please  enter email", preferredStyle: .alert)
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
            Auth.auth().signIn(withEmail: emailTF.text ?? "", password: passwordTF.text ?? "") { (Result, Error) in
                if Error != nil
                {
                    let alertshow = UIAlertController(title: "ERROR", message: "Invalid UserName Password", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                    })
                    alertshow.addAction(ok)
                    self.present(alertshow, animated: true)
                }
                else
                {
                    UserDefaults.standard.set(Result?.user.uid, forKey: "userId")
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homesection") as! UITabBarController
                    
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
        }
    }
}
