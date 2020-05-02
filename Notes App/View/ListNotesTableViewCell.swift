//
//  ListNotesTableViewCell.swift
//  Notes App
//
//  Created by Aman Meena on 01/05/20.
//  Copyright © 2020 Aman Meena. All rights reserved.
//

import UIKit

class ListNotesTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK:- IBOutlets
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteModificationTimeLabel: UILabel!
}
