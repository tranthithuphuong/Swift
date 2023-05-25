//
//  FriendTableViewCell.swift
//  DemoIOSNetworking
//
//  Created by chuottp on 22/09/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFriendAvatar: UIImageView!
    
    @IBOutlet weak var lblFriendName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
