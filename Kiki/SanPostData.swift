

import UIKit
import Firebase
import FirebaseDatabase

class SanPostData: NSObject {
    var id: String?
    var date: NSDate?
    var users: [String] = []
    var genre:[String] = []
    //ジャンルの最新状況確認済みかどうかをtrue falseで判断
    var sansyoued: Bool = false
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        //firebaseのデータ
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        if let users2 = valueDictionary["users"] as? [String] {
            self.users = users2
        }
        genre = (valueDictionary["genre"] as? [String])!
        self.date = NSDate(timeIntervalSinceReferenceDate: valueDictionary["time"] as! TimeInterval)

        for usersId in users {
            if usersId == myId {
                sansyoued = true
                break
           }
        }


  }
}
