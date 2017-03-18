

import UIKit
import Firebase
import FirebaseDatabase

class SanPostData2: NSObject {
    var genre: String?
    var users: [String] = []
    var sansyoued: Bool = false
    
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        genre = valueDictionary["genre"] as? String
        
        
        if let users2 = valueDictionary["users"] as? [String?] {
            self.users = users2 as! [String]
        }
        
        for usersId in users {
            if usersId == myId {
                sansyoued = true
                break
            }
        }
    }
}
