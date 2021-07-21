//
//  CustomTableViewCell.swift
//  Prize_2
//
//  Created by Evgen Classik on 20.07.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameCell: UILabel!
    
    @IBOutlet weak var costCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

