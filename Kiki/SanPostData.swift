

import UIKit
import Firebase
import FirebaseDatabase

class SanPostData: NSObject {
    var id: String?
    var date: NSDate?
    var users: [String] = []
    //var sansyoued: Bool = false
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        if let users2 = valueDictionary["users"] as? [String] {
            self.users = users2
        }
        //for usersId in users {
            //if usersId == myId {
               // sansyoued = true
                //break
           // }
        //}
        self.date = NSDate(timeIntervalSinceReferenceDate: valueDictionary["time"] as! TimeInterval)
    //}

  }
}
