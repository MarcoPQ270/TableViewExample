//
//  TableViewCell.swift
//  appclases
//
//  Created by labdesarrollo5 on 9/12/19.
//  Copyright © 2019 labdesarrollo5. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbltitulo: UILabel!
    @IBOutlet weak var lblsubtitulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
