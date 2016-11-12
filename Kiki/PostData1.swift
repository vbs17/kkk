

import UIKit
import Firebase
import FirebaseDatabase

class PostData1: NSObject{
    var id: String?
    var image: UIImage?
    var imageString: String?
    var hiniti: String?
    var zikoku: String?
    var station: String?
    var path: String?
    var uid: String?
    var nin: String?
    var join: [String] = []
    var isLiked: Bool = false
    
    
    init(snapshot: FIRDataSnapshot, myId: String){
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64EncodedString: imageString!, options: .IgnoreUnknownCharacters)!)
        hiniti = valueDictionary["hiniti"] as? String
        zikoku = valueDictionary["zikoku"] as? String
        station = valueDictionary["station"] as? String
        path = valueDictionary["path"] as? String
        nin = valueDictionary["nin"] as? String
        uid = valueDictionary["uid"] as? String
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
