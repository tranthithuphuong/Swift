
import UIKit

class FoodTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var lblFoodCategoryName: UILabel!
    @IBOutlet weak var foodsCollectionView: UICollectionView!
    var numberOfFoods: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        foodsCollectionView.register(UINib(nibName: "FoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "foodCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWidth/2-10, height: 100)
        foodsCollectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfFoods
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodsCollectionView.dequeueReusableCell(withReuseIdentifier: "foodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        cell.lblFoodName.text = "Món thứ \(indexPath.row)"
        cell.backgroundColor = .red
        return cell
    }
    
}
