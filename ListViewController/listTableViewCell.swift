//
//  listTableViewCell.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 29/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit





class listTableViewCell: UITableViewCell {

    @IBOutlet weak var contentview: UIView!
    
    @IBOutlet weak var lbl_Id: UILabel!
    
    @IBOutlet weak var btn_starOutlet: UIButton!
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    var tapblock:(() -> Void)?  = nil
   
    
    @IBAction func btn_StarButton(_ sender: UIButton) {
        tapblock!()
      
    }
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
