
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProIdouViewController: UIViewController {
    
    var uid:String!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var line: UITextField!
    @IBOutlet weak var twitter: UITextField!
    
    @IBOutlet weak var face: UITextField!
    @IBOutlet weak var insta: UITextField!
    @IBOutlet weak var p: UITextField!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        imageView.clipsToBounds = true
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.isUserInteractionEnabled = false
        line.isUserInteractionEnabled = false
        twitter.isUserInteractionEnabled = false
        face.isUserInteractionEnabled = false
        insta.isUserInteractionEnabled = false
        p.isUserInteractionEnabled = false
        
        
        
        FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: {[weak self] snapshot in
            guard let `self` = self else { return }
            let postData = PostData2(snapshot: snapshot, myId: snapshot.key)
            
            if ( postData.uid == self.uid ) {
                
                self.imageView.image = postData.image
                self.name.text = postData.name
                self.line.text = postData.line
                self.twitter.text = postData.twitter
                self.face.text = postData.facebook
                self.insta.text = postData.den
                self.p.text = postData.ta
            }
            else {
            }
        })
        
        FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: {[weak self] snapshot in
            guard let `self` = self else { return }
            if ( snapshot.key == self.uid ) {
                let postData = PostData2(snapshot: snapshot, myId: snapshot.key)
                self.imageView.image = postData.image
                self.name.text = postData.name
                self.line.text = postData.line
                self.twitter.text = postData.twitter
                self.face.text = postData.facebook
                self.insta.text = postData.den
                self.p.text = postData.ta
            }
            else {
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
