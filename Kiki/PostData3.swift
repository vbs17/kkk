
import UIKit
import Firebase
import FirebaseDatabase

class PostData3: NSObject{
    var id: String?
    var image: UIImage?
    
    init(snapshot: FIRDataSnapshot, myId: String){
        id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
    let imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
    }
}
