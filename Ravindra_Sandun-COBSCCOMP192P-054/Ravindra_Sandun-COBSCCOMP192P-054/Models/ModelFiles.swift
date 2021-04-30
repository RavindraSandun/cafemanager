//
//  ModelFiles.swift
//  Ravindra_Sandun-COBSCCOMP192P-054
//
//  Created by Sandun on 4/10/21.
//

import Foundation

import Foundation
import UIKit

class Category {
    var id : String
    var name : String
    init(id : String,name : String) {
        self.id = id
        self.name = name
     }
}

class FoodItem {
    var Name : String
    var discription : String
    var price : Float
    var discount : Int
    var id : String
    var documentId : String
    var category : String
    var active : Bool
   
    
    init(Name : String,discription : String,price : Float,discount:Int,id:String,documentId:String,category:String,active:Bool) {
        
        self.Name = Name
        self.discription = discription
        self.price = price
        self.discount = discount
        self.id = id
        self.documentId = documentId
        self.category = category
        self.active = active
        
        
    }
}
 
class FoodDetail {
    var category : String
    var food : [FoodItem]
   
    
    init(category : String,food : [FoodItem] ) {
        
        
        self.category = category
        self.food = food
        
    }
}

class Orders {
    var customername : String
    var docid : String
    var userid : String
    var status : Int
    var section : String
    var orderno : String
    var customerphone : String
   
    
    init(cusname : String,docid : String,userid:String,status:Int,section:String,orderno:String,cusphone:String) {
        
        
        self.customername = cusname
        self.docid = docid
        self.userid = userid
        self.status = status
        self.section = section
        self.orderno = orderno
        self.customerphone = cusphone
        
        
    }
}
