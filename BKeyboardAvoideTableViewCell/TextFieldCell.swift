//
//  TextFieldCell.swift
//  BKeyboardAvoideTableViewCell
//
//  Created by BhumeshwerKatre on 06/12/20.
//  Copyright © 2020 BhumeshwerKatre. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    static let cellID = "TextFieldCellID"
    @IBOutlet weak var aTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
