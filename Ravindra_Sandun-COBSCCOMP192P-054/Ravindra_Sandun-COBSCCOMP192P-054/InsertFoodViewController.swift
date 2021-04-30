

import UIKit
import Firebase
import FirebaseStorage

class CellClassset : UITableViewCell{
    
}

class InsertFoodViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var fooddescrip: UITextField!
    @IBOutlet weak var price: UITextField!
    
    @IBOutlet weak var swich: UISwitch!
    
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    let transparentView = UIView()
    var selectedbtn = UIButton()
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func uploadimage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imagedata = image.pngData() else {
            return
        }
        
        self.image.image = UIImage(data: imagedata)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func validationset() -> String? {
        if name.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || fooddescrip.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || price.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || discount.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return ""
        }
        else
        {
            return " fields empty"
        }
    }
    
    @IBAction func addevent(_ sender: Any) {
        
        
        if validationset() != ""
        {
                var active : Bool = false
                
                if swich.isOn
                {
                    active = true
                }
                else
                {
                    active = false
                }
                
                let db = Firestore.firestore()
                let ref2 =  db.collection("Food").document()
                let discountver = Float(discount.text!)
                let sellprice = Float(price.text!)
                
                
                ref2.setData(["Name":name.text!,"active":active,"description":fooddescrip.text,"dicid":ref2.documentID,"discount":discountver ,"price":sellprice,"id":ref2.documentID]) { (err) in
                    if err != nil{
                        
                    }
                    else
                    {
                        
                        let storage = Storage.storage().reference()
                        
                        let path:String = "foodimages/" + ref2.documentID + ".png"
                        
                        storage.child(path).putData((self.image.image?.pngData())!, metadata: nil) { (_, Error) in
                            if Error != nil
                            {
                                print("erro")
                            }
                            else
                            {
                            }
                        }
                        
                        let alert = UIAlertController(title: "Success", message: "Food Added Successfully", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                        })
                        alert.addAction(ok)
                        self.present(alert, animated: true)
                    }
                }
 
        }
        else
        {
            let alert = UIAlertController(title: "ERROR", message: "Please fill all fields", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
        
    }
}

