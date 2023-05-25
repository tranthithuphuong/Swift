//
//  AnimalsCategoryTableViewCell.swift
//  LuyenTapAPI
//
//  Created by chuottp on 23/09/2022.
//

import UIKit

class AnimalsCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var lblAnimalName: UILabel!
    @IBOutlet weak var imgAnimalAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.setImage(UIImage(named: "unliked"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    override func prepareForReuse() {
        likeButton.setImage(UIImage(named: "unliked"), for: .normal)
    }
    
}
