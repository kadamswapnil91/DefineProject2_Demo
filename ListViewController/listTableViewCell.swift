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
  
    @IBOutlet weak var btn_starReference: UIButton!
    
    @IBOutlet weak var lbl_Name: UILabel!

    @IBOutlet weak var StarReference: UIButton!
    
     var isLiked = Bool()
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
