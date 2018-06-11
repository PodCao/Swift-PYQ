//
//  PYQCollectionViewCell.swift
//  SwiftObject
//
//  Created by cao yu on 2018/5/9.
//  Copyright © 2018年 cao yu. All rights reserved.
//

import UIKit

class PYQCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var showImage: UIImageView!
    var image:UIImage?{
        didSet{
            if image == nil{
                showImage.image = image;
            }else {
                showImage.image = nil;
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
