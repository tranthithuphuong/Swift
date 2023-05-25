//
//  PersonTableViewCell.swift
//  MultiChoiceItem
//
//  Created by chuottp on 30/09/2022.
//

import UIKit
import SwiftUI

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var btnChoose: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func SelectPerson(_ sender: UIButton) {
        print(sender)
        sender.backgroundColor = UIColor.blue
        sender.setTitle("V", for: UIControl.State.normal)
        sender.tintColor = UIColor.white
    }
}
