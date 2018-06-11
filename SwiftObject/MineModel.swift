//
//  MineModel.swift
//  SwiftObject
//
//  Created by cao yu on 2018/5/9.
//  Copyright © 2018年 cao yu. All rights reserved.
//

import UIKit

@objcMembers class MineModel: NSObject {
    var nickname :String? // 昵称
    var user_pic :String? //头像
    var content :String? // 内容
    var time :String?//时间
    var pics : [String] = [] // 图片数组
    var imageW : CGFloat = 0 //图片的宽（确切的说时item的宽）
    var imageH : CGFloat = 0 //图片的高（确切的说时item的高）
}
