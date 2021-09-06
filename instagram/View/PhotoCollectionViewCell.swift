//
//  PhotoCollectionViewCell.swift
//  instagram
//
//  Created by Christian Willson on 31/08/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    var imageName: String! {
        didSet {
            userImage.image = UIImage(named: imageName)
        }
    }
}
