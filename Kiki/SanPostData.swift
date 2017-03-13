

import UIKit
import Firebase
import FirebaseDatabase

class SanPostData: NSObject {
    var genre: [String] = []
    var users: [String] = []
    //どう使うか未定
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        if let genre2 = valueDictionary["genre"] as? [String?] {
            self.genre = genre2 as! [String]
        }
        
        if let users2 = valueDictionary["users"] as? [String?] {
            self.users = users2 as! [String]
        }
        
           }
}
