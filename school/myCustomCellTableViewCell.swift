//
//  myCustomCellTableViewCell.swift
//  QuickstartApp
//
//  Created by Baraam on 2017-11-11.
//  Copyright © 2017 Baraam. All rights reserved.
//

import UIKit

class myCustomCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelDaily: UILabel!
    @IBOutlet weak var labelLongTerm: UILabel!
    @IBOutlet weak var labelCafeSpecials: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
