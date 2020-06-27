//
//  HomeViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 26/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

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


class HomeViewController: UIViewController {

    @IBOutlet weak var txt_id: UITextField!
    
    @IBOutlet weak var txt__name: UITextField!
    
    @IBAction func btn_save(_ sender: UIButton) {
        
        let dict = ["id":txt_id.text,"name":txt__name.text]
        DatabaseHelper.ShareInstance.save(object: dict as! [String:String])
        
    }
    
    @IBOutlet weak var btn_menu: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        ///// menu button pops 
        btn_menu.target = self.revealViewController()
        btn_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        
         getdata()

        
    }

    
    
////api parsing
    func getdata()
    {

        let url = URL(string: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Root.self, from: data)
                    result.response.venues.forEach{ print($0.id,":",$0.name)
                    
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
