//
//  FriendTableViewCell.swift
//  API
//
//  Created by chuottp on 15/11/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameFriend: UILabel!
    @IBOutlet weak var imgAvatarFriend: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
