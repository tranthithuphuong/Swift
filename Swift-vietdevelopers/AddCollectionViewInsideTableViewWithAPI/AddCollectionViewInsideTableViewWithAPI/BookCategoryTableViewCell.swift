//
//  BookCategoryTableViewCell.swift
//  AddCollectionViewInsideTableViewWithAPI
//
//  Created by chuottp on 28/09/2022.
//

import UIKit
import Kingfisher
import Alamofire

class BookCategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var cltBookCategory: UICollectionView!
    @IBOutlet weak var lblGroupBookName: UILabel!
    var books : Books = []
    override func awakeFromNib() {
        super.awakeFromNib()
        cltBookCategory.delegate = self
        cltBookCategory.dataSource = self
        cltBookCategory.register(UINib(nibName: "BookCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCellIdentifier")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        cltBookCategory.collectionViewLayout = layout
        getBooksFromAPI()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let curentBook = books[indexPath.row]
        let cell = cltBookCategory.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCellIdentifier", for: indexPath) as! BookCategoryCollectionViewCell
        cell.lblBookPrice.text = "Giá: \(curentBook.price)"
        cell.lblBookPrice.textColor = .purple
        cell.layer.borderWidth = 0.5
        
        let urlAvatar = URL(string: curentBook.avatar)
        cell.imgBookAvatar.kf.setImage(with: urlAvatar)
        
        let likeButton = UIButton()
        likeButton.frame = CGRect(x: 50, y: 80, width: 50, height: 50)
        likeButton.backgroundColor = .blue
        likeButton.setTitle("Like", for: .normal)
        likeButton.tag = indexPath.row
        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        cell.addSubview(likeButton)
        return cell
        
    }
    @objc func likeAction(_ sender: UIButton) {
        
        print("Like button clicked on cell \(sender.tag)")
        }
    
    func getBooksFromAPI() {
        AF.request("https://6332aadda54a0e83d2558ba5.mockapi.io/Book", method: .get) .responseDecodable(of: Books.self) { responseData in
            if let bookData = responseData.value {
                self.books = bookData
                self.cltBookCategory.reloadData()
            }
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
