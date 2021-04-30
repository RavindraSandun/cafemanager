

import UIKit
import Firebase
import FirebaseStorage

class FoodShowViewController: UIViewController {
    
    @IBOutlet weak var foodtableview: UITableView!
    
    var foodlist : [FoodDetail] = []
    var categorylist : [Category] = []
    var fooditemlist : [FoodItem] = []
  //firebase get
    let db = Firestore.firestore()


    override func viewDidLoad() {
        super.viewDidLoad()
 
        foodtableview.delegate = self
        foodtableview.dataSource = self
 
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        categorylist.removeAll()
        fooditemlist.removeAll()
        let docRef = db.collection("category")

        docRef.getDocuments { (snapshot, error) in
            if error != nil
            {
                print("error")
            }
            else
            {

                for document in (snapshot?.documents)!
                {

                    let dd=document.data()
                    let name = dd["name"] as! String
                    let id = dd["id"] as! String

                    let category = Category(id: id, name: name)

                    self.categorylist.append(category)


                }



            }
            
            self.foodtableview.reloadData()


        }
        
        
        let docRef2 = db.collection("Food")
     
        docRef2.getDocuments { (snapshot, error) in
            if error != nil
            {
                print("error")
            }
            else
            {
               
                for document in (snapshot?.documents)!
                {
                   
                    let dd=document.data()
                    let name = dd["Name"] as! String
                     let discrip = dd["description"] as! String
                     let price = dd["price"] as! Float
                     let discount = dd["discount"] as! Int
                     let foodId = dd["id"] as! String
                     let docid = dd["dicid"] as! String
                    let active = dd["active"] as! Bool
                     
                   
                     
                     
                     
                     let foodget = FoodItem(Name:name,discription: discrip,price: price,discount: discount,id: foodId,documentId: docid,category: "",active: active)
                     
                     self.fooditemlist.append(foodget)
                    
                    
                    
   
                }
                self.foodtableview.reloadData()
                
                
                
            }
            
            
        }
        
        
    }
    
   
   
    

}

extension FoodShowViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    
    
}

extension FoodShowViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fooditemlist.count
    }
    
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = foodtableview.dequeueReusableCell(withIdentifier: "cell") as! FoodTableViewCell
         
        cell.setfood(food: fooditemlist[indexPath.row])
 
        return cell
        
    }
 
}


