
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewPerson.dequeueReusableCell(withReuseIdentifier: "cellPerson", for: indexPath)
        cell.layer.backgroundColor = UIColor.yellow.cgColor
        return cell
    }
    
    
    var persons: [Person] = []
    var person = [Person]()
    
    @IBOutlet weak var collectionViewPerson: UICollectionView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/3-10, height: 100)
        collectionViewPerson.collectionViewLayout = layout
        
        collectionViewPerson.dataSource = self
        collectionViewPerson.delegate = self
    }
}
struct Person {
    var name: String
    
}


