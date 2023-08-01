

//
//  HomeViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 26/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit
import CoreData

struct Root : Decodable {
    let response : Response
}

struct Response : Decodable {
    let venues : [Venue]
}

struct Venue: Decodable {
    let id: String
    let name: String
    
}


class HomeViewController: UIViewController, Datapass {
    
    @IBAction func act_nexttotableview(_ sender: UIButton) {
        
        let nexttotableview : ListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(nexttotableview, animated: true)
        
        
    }
      let array = NSMutableArray()
    var i = Int()
    var isUpdate = Bool()
    @IBOutlet weak var txt_id: UITextField!
    let dict = NSMutableDictionary()
    
    @IBOutlet weak var txt__name: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ///// menu button pops
        btn_menu.target = self.revealViewController()
        btn_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        var firsttime = Bool()
        firsttime = UserDefaults.standard.bool(forKey: "firsttime")
        if (!firsttime )
        {
          getdata()
        }
        print(">>>>>>>>>>",firsttime)
    }
    
    func data(object: [String : String], index:Int, isEdit:Bool) {
        
        txt_id.text = object["id"]
        txt__name.text = object["name"]
        i = index
        print("Selected index is :",i)
        
        isUpdate = isEdit
    }
    
    
    @IBAction func btn_save(_ sender: UIButton) {
        
        let dict = ["id":txt_id.text,"name":txt__name.text]
        
        if isUpdate{
            DatabaseHelper.ShareInstance.editData(object: dict as! [String:String], i: i)
            
        }
        else{
            
            DatabaseHelper.ShareInstance.save(object: dict as! [String:String])
        }
        
        
    }
    
    
    @IBAction func btn_Show(_ sender: UIButton) {
        
        let listview = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        listview.delegate = self ////if we doesnt write this then we cant move from second controller to first
        self.navigationController?.pushViewController(listview, animated: true)
        
    }
    
    @IBOutlet weak var btn_menu: UIBarButtonItem!
    
    ////api parsing
    func getdata()
    {
      
        
        
        
        let url = URL(string: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Root.self, from: data)
                    result.response.venues.forEach{ print($0.id,":",$0.name)
                        
                        self.dict.setValue($0.id, forKeyPath: "id")
                        self.dict.setValue($0.name, forKeyPath: "name")
                        
                        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
                        
                        
                        
                        
                        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
                        
                        user.id = $0.id as? String
                        user.name = $0.name as! String
                        
                        do{
                            try context?.save()
                            print("Data saved Sucessfully!!")
                        }catch{
                            print("Data is not saved")
                        }
                        UserDefaults.standard.set(true, forKey: "firsttime")
                       // self.array.add(self.dict)
                        
                    }
                } catch {
                    print(error)
                }
                
//                if(self.array.count != 0)
//                {
//                    
//                    for index in 0...self.array.count-1
//                    {
//                        var dict1 = NSDictionary()
//                        dict1 = self.array[index] as! NSDictionary
//                        
//                     
//                        
//                    }
//                    
//                }
//                
//                print("Dict = ",self.array)
            }
        }
        task.resume()
        
        
    }
}
