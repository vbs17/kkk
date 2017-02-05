

import UIKit
import AVFoundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class Home22TableViewCell: UITableViewCell {

    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var pathGo: UIButton!
    @IBOutlet weak var join: UIButton!
    @IBOutlet weak var iku: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var ikuhito: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    
    func setPostData(_ postData: PostData11, myid: String) {
        label1.text = postData.hiniti
        label2.text = postData.zikoku
        label3.text = postData.station
        let likeNumber = postData.join.count
        ikuhito.text = "\(likeNumber)"
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "IMG_2727 2")
            join.setImage(buttonImage, for: UIControlState())
        } else {
            let buttonImage = UIImage(named: "IMG_2728 2")
            join.setImage(buttonImage, for: UIControlState())
        }
    }
    
    func setPostData1(_ postData: PostData44, myid: String) {
        ImageView.image = postData.image
    }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pathGo.layer.cornerRadius = 35
        pathGo.clipsToBounds = true
        imageView1.layer.cornerRadius = 22.2
        imageView1.clipsToBounds = true
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
