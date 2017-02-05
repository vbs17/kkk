

import UIKit
import Firebase
import FirebaseDatabase

class PostData11: NSObject {
    var id: String?
    var hiniti: String?
    var zikoku: String?
    var station: String?
    var path: String?
    var uid: String?
    var time: Double?
    
    var join: [String] = []
    var isLiked: Bool = false
    
    
    init(snapshot: FIRDataSnapshot, myId: String){
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        hiniti = valueDictionary["hiniti"] as? String
        zikoku = valueDictionary["zikoku"] as? String
        station = valueDictionary["station"] as? String
        path = valueDictionary["path"] as? String
        uid = valueDictionary["uid"] as? String
        time = valueDictionary["time"] as? Double
        
        if let join = valueDictionary["join"] as? [String] {
            self.join = join
        }
        
        for likeId in join {
            if likeId == myId {
                isLiked = true
                break
            }
        }
        
        
    }
}
