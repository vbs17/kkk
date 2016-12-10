

import UIKit
import Firebase
import FirebaseDatabase



class PostData: NSObject {
    var id: String?
    var name: String?
    var song: String?
    var byou: String?
    var star: Array<[String:String]> = []
    var uid: String?
   
   
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        byou = valueDictionary["byou"] as? String
        name = valueDictionary["songname"] as? String
        song = valueDictionary["ongen"] as? String
        if let stars = valueDictionary["star"] as? Array<[String:String]> {
            self.star = stars
        }
        uid = valueDictionary["uid"] as? String


    
  }
}
