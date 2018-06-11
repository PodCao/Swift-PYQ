//
//  Student.swift
//  SwiftObject
//
//  Created by cao yu on 2017/5/20.
//  Copyright © 2017年 cao yu. All rights reserved.
//

import UIKit

class Student: NSObject {

    var number : Int = 0
    var name : String = ""
    var height : Float = 0
    
    func demo() -> Void {
        print("Student")
    }
    
    var newName : String?
    var age : Int = 0
    {
        willSet
        {
            print(newValue)
        }
        didSet
        {
            if age < 10 {
                newName = "lucy"
            }else{
                newName = "lily"
            }
            print(newName!,oldValue,age)
        }
        
    }
    class func winter(){
        print("winter is coming")
    }
    static func summer(){
        print("summer is coming")
    }
    
    
    
    
}
