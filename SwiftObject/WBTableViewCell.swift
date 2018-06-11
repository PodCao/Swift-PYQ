//
//  WBTableViewCell.swift
//  SwiftObject
//
//  Created by cao yu on 2018/5/7.
//  Copyright © 2018年 cao yu. All rights reserved.
//

import UIKit

class WBTableViewCell: UITableViewCell,UITextFieldDelegate {
    let edgeMargin = 5;

    @IBOutlet weak var collectionW: NSLayoutConstraint!
    @IBOutlet weak var collectionH: NSLayoutConstraint!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var headerIma: UIImageView!
    var myModel:MineModel = MineModel(){
        didSet{
            headerIma.image = UIImage.init(named: myModel.user_pic!);
            nameLab.text = myModel.nickname;
            contentLab.text = myModel.content;
        }
    }
    var images:[String] = [String](){
        didSet{
            let width:Float = 80;
            let edge:Float = 50;
            let itemWH:CGFloat = (ScreenWitdh - CGFloat(width) - 25 - CGFloat(edge) - (4 * CGFloat(edgeMargin)))/3 //  80左边距，25右边距
            //  as? 和 as! 操作符的转换规则完全一样。但 as? 如果转换不成功的时候便会返回一个 nil 对象。成功的话返回可选类型值（optional），需要我们拆包使用。
            //  由于 as? 在转换失败的时候也不会出现错误，所以对于如果能确保100%会成功的转换则可使用 as!，否则使用 as?
            let layout = imageCollection.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize.init(width: itemWH, height: itemWH);
            if images.count == 0{
                collectionH.constant = 0;
            }else if images.count == 1 {
                collectionH.constant = myModel.imageH;
                collectionW.constant = myModel.imageW;
                layout.itemSize = CGSize.init(width: myModel.imageW - 10, height: myModel.imageH - 10);
            } else if images.count < 4{
                collectionW.constant = ((itemWH + 5) * CGFloat(images.count))  + 1 //加1 中和误差
                collectionH.constant = itemWH + 5
            }
            else if images.count == 4 {
                collectionW.constant = itemWH * 2 + 5 + 5 + 5 + 1 //加1 中和误差
                collectionH.constant = itemWH * 2 + 5 + 5 + 1 //加1 中和误差
            }
            else if images.count <= 6
            {
                collectionW.constant = ScreenWitdh - 80 - 25
                collectionH.constant = itemWH * 2 + 5 + 5
            }
            else{
                collectionW.constant = ScreenWitdh - 80 - 25
                collectionH.constant = ScreenWitdh - 80 - 25 + 5
            }
            layout.minimumInteritemSpacing = CGFloat(edgeMargin);
            layout.minimumLineSpacing = CGFloat(edgeMargin);
            imageCollection.register(UINib.init(nibName: "PYQCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PYQCollectionViewCell");
            imageCollection.dataSource = self;
            imageCollection.delegate = self;
            imageCollection.contentInset = UIEdgeInsetsMake(CGFloat(edgeMargin), CGFloat(edgeMargin), 0, CGFloat(edgeMargin))
            imageCollection.reloadData()
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension WBTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PYQCollectionViewCell", for: indexPath) as! PYQCollectionViewCell;
        cell.showImage.image = UIImage.init(named: images[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //            lookImage(indexRow: indexPath.item)
    }
    
}
