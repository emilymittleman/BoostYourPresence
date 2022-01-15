//
//  SocialMediaRow.swift
//  BoostYourPresence
//
//  Created by Emily Mittleman on 1/13/22.
//

import UIKit

class SocialMediaRow: UITableViewCell {
    
    @IBOutlet weak var socialMediaCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SocialMediaRow : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialMediaPlatforms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath is [section, element #]
        // section is always 0 so use collectionView.tag instead
        let socialMediaCell = collectionView.dequeueReusableCell(withReuseIdentifier: "socialMediaCell", for: indexPath) as! SocialMediaCell
        let socialMedia: SocialMedia = socialMediaPlatforms[indexPath.row]
        socialMediaCell.imageView.image = UIImage(named: socialMedia.imageName)
        return socialMediaCell
    }
}

extension SocialMediaRow : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(indexPath)
        // for the Recommended Stays section
        var itemsPerRow:CGFloat = 1.5
        var hardCodedPadding:CGFloat = 5
        var itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        var itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        
        // meaning it's the All Stays section
        if (collectionView.tag == 1) {
            itemsPerRow = 2
            hardCodedPadding = 5
            itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
            itemHeight = (collectionView.bounds.height - (2 * hardCodedPadding))
        }
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
