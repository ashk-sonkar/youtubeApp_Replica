//
//  CollectionViewCell.swift
//  YouTubeReplica
//
//  Created by Ashish Kumar Sonkar on 23/08/17.
//  Copyright © 2017 Ashish Kumar Sonkar. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Implemented")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isHighlighted: Bool{
        didSet{
            iconImage.tintColor = isHighlighted ? UIColor.white : Support.usedColors.iconInactiveColour
        }
    }
    
    override var isSelected: Bool {
        didSet{
            iconImage.tintColor = isSelected ? UIColor.white : Support.usedColors.iconInactiveColour
        }
    }
    
    
}
