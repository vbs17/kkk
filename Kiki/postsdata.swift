//
//  postsdata.swift
//  Kiki
//
//  Created by kei ikeuchi on 2016/12/25.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit
import RealmSwift

class postsdata: NSObject {
    
    dynamic var name: String?
    dynamic var song: String?
    dynamic var byou: String?
    dynamic var star: Array<[String:String]> = []
    var time: RealmOptional<Double>?
    dynamic var uid: String?

    
}
