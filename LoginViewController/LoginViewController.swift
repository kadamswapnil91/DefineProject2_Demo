//
//  LoginViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 29/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txt_Email: UITextField!
    
    @IBOutlet weak var txt_Password: UITextField!
    
    let email = "123456"
    let password = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var btn_Login: UIButton!
    
    @IBAction func onclick_Login(_ sender: UIButton) {
        
        //        if email == txt_Email.text! && password == txt_Password.text!
        //        {
        let HomeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(HomeVC, animated: true)
        print("login Sucessfully!!")
        //  }
        //        else
        //        {
        //            let alert = UIAlertController (title: "Alert", message: "Enter Correct Credentials", preferredStyle: .alert)
        //
        //            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        //            alert.addAction(ok)
        
        //            present(alert, animated: true, completion: nil)
        //
        //            }
        //
        //
    }
    //
    
    
    
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */





