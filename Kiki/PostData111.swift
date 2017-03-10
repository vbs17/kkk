
import UIKit
import Firebase
import FirebaseDatabase

class PostData111: NSObject {
    var id: String?
    var name: String?
    var song: String?
    var byou: String?
    var original: String?
    var cover: String?
    var star: Array<[String:String]> = []
    var time: Double?
    var uid: String?

    
    init(snapshot: FIRDataSnapshot, myId: String) {
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        byou = valueDictionary["byou"] as? String
        name = valueDictionary["songname"] as? String
        song = valueDictionary["ongen"] as? String
        original = valueDictionary["original"] as? String
        cover = valueDictionary["cover"] as? String
        time = valueDictionary["time"] as? Double
        if let stars = valueDictionary["star"] as? Array<[String:String]> {
            self.star = stars
        }
        uid = valueDictionary["uid"] as? String
        
        
        
    }
}
