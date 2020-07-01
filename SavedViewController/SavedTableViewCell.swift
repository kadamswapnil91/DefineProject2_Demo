//
//  SavedTableViewCell.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 01/07/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_savedid: UILabel!
    
    @IBOutlet weak var lbl_savedName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
