//
//  PhotoCell.swift
//  PhotosCollectionView
//
//  Created by MyAList on 7/16/19.
//  Copyright © 2019 amrfawaz. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.cornerRadius = imageView.frame.height / 2
//        imageView.addBorder(width: 4, color: UIColor.gray)
//        imageView.layer.cornerRadius = imageView.frame.height/2
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.layer.borderWidth = 4

    }
    
    
    func loadImage(url: URL) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }
    
    
}
