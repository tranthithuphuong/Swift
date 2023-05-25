//
//  FriendTableViewCell.swift
//  DemoAPINetworkingWithAlamofire
//
//  Created by blackhat on 22/09/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var btnChangeInfo: UIButton!
    @IBOutlet weak var btnDeletePerson: UIButton!
    @IBOutlet weak var imgFriendAvatar: UIImageView!
    @IBOutlet weak var lblFriendName: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var indexPath: IndexPath = []
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.setImage(UIImage(named: "unlike"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        likeButton.setImage(UIImage(named: "unlike"), for: .normal)
    }

}
