//
//  customCell.swift
//  todoApp4
//
//  Created by Mohsin on 13/11/2017.
//  Copyright © 2017 Mohsin. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var customTitle: UILabel!
    @IBOutlet weak var customDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
