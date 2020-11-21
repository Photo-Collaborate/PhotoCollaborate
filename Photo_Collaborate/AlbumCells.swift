//
//  AlbumCells.swift
//  Photo_Collaborate
//
//  Created by Sabahet Alovic on 11/19/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit

class AlbumCells: UITableViewCell {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var AlbumNameLabel: UILabel!
    
    @IBOutlet weak var usersName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
