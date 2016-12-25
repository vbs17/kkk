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
    dynamic var time: Double?
    dynamic var uid: String?

    
}
