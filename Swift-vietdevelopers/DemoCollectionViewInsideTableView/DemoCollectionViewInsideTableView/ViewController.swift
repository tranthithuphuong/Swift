

import UIKit

enum SectionHome: Int, CaseIterable {
    case popularMovie
    case popularActor
    case upcoming
    case recommend
    case nowPlaying
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "Sections", bundle: nil), forCellWithReuseIdentifier: "Sections")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionHome.allCases[section] {
        case .popularMovie:
            return 1
        case .popularActor:
            <#code#>
        case .upcoming:
            <#code#>
        case .recommend:
            <#code#>
        case .nowPlaying:
            <#code#>
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionHome.allCases[indexPath.section] {
            
        case .popularMovie:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Sections", for: indexPath) as! Sections
            return cell
        case .popularActor:
            <#code#>
        case .upcoming:
            <#code#>
        case .recommend:
            <#code#>
        case .nowPlaying:
            <#code#>
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch SectionHome.allCases[indexPath.section] {
        case .popularMovie:
            return CGSize(width: self.collectionView.frame.width, height: 300)
        case .popularActor:
            <#code#>
        case .upcoming:
            <#code#>
        case .recommend:
            <#code#>
        case .nowPlaying:
            <#code#>
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch SectionHome.allCases[section] {
        case .popularMovie:
            return UIEdgeInsets(top: 100, left: 16, bottom: 0, right: 16)
        case .popularActor:
            <#code#>
        case .upcoming:
            <#code#>
        case .recommend:
            <#code#>
        case .nowPlaying:
            <#code#>
        }
    }
}

