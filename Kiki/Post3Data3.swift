//
//  Post3Data3.swift
//  Kiki
//
//  Created by kei ikeuchi on 2017/02/04.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class Post3Data3: NSObject {
    var id: String?
    var image: UIImage?
    
    init(snapshot: FIRDataSnapshot, myId: String){
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        let imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
    }
}
