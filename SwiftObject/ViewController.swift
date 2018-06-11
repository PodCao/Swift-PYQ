//
//  ViewController.swift
//  SwiftObject
//
//  Created by cao yu on 2017/5/20.
//  Copyright © 2017年 cao yu. All rights reserved.
//

import UIKit
import YYModel
import SDWebImage
struct Person {
    var name = "yu"
    var age = 19
    
    
}
struct StudentInfo {
    var name = ""
    var age = 12.0
    func showStudentInfo() -> Void {
        print("姓名：\(name)---年龄:\(age)")
    }
    
    
}

class ViewController: UIViewController{

    @IBOutlet weak var buttonTest: UIButton!
    var myView:UIView!
    lazy var myTable:UITableView = UITableView();
    let stringArr:[NSString] = ["f","woshihui","uuuu"];
    lazy var dateArr:NSMutableArray = NSMutableArray();
    
    lazy var lab:UILabel = UILabel();
    let cellID = "WBTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        self.setUI();
        setData();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUI() -> Void {
        myTable.frame = CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: ScreenWitdh, height: ScreenHeight));
        myTable.delegate = self;
        myTable.dataSource = self;
        myTable.register(UINib.init(nibName: "WBTableViewCell", bundle: nil), forCellReuseIdentifier: cellID);
        view.addSubview(myTable);
    }
    func setData(){
        var contentStr = "uuuuu"
        for i in 0 ..< 10 {
            contentStr =  contentStr + "\(i)"
            var arr : [String] =  [String]()
            for j in 0 ..< i{
                arr.append("\(j).jpg")
            }
            var dic1 :[String : Any] = ["nickname":"昵称\(i)",
                "user_pic":"\(i).jpg",
                "content":contentStr,
                "time":"\(i)小时前",
                "pics":arr ]
            //只有一张图片
            if i == 1{
                //可以换不同的图片进行尝试
                let image : UIImage = UIImage.init(named: "4.jpg")!
                if image.size.width > image.size.height{
                    //宽大于高时
                    dic1["imageW"] = ScreenWitdh * 2 / 3
                    dic1["imageH"] = ScreenWitdh * 2 / 3 * (image.size.height/image.size.width)
                }
                else{
                    //高大于等于宽时
                    dic1["imageW"] = ScreenWitdh * 2 / 3 * (image.size.width/image.size.height)
                    dic1["imageH"] = ScreenWitdh * 2 / 3
                }
            }
            let  mineModel:MineModel  = MineModel.yy_model(with: dic1)!
            self.dateArr.add(mineModel)
            myTable.reloadData()
        }
    }
    func viewTap(sender: UITapGestureRecognizer) {
        print("clicked...\(sender)");
        
    }
    func sum(n:NSInteger,M:NSInteger) -> NSInteger {
        return n + M;
    }
    func buttonAction(sender:UIButton) -> Void {
        print("uyuyyyyyyyyyyy\(sender)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! WBTableViewCell;
        let mineModel:MineModel  = self.dateArr[indexPath.row] as! MineModel;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.myModel = mineModel;
        cell.images = mineModel.pics;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)");
    }
}

