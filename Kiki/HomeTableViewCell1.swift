
import UIKit
import AVFoundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


class HomeTableViewCell1: UITableViewCell {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var pathGo: UIButton!
    @IBOutlet weak var join: UIButton!
    @IBOutlet weak var ikuhito: UILabel!
    
    @IBOutlet weak var iku: UIButton!
    //参考
    func setPostData(postData: PostData1, myid: String) {
        ImageView.image = postData.image
        label1.text = postData.hiniti
        label2.text = postData.zikoku
        label3.text = postData.station
        let likeNumber = postData.join.count
        ikuhito.text = "\(likeNumber)"
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "IMG_2727 2")
            join.setImage(buttonImage, forState: UIControlState.Normal)
        } else {
            let buttonImage = UIImage(named: "IMG_2728 2")
            join.setImage(buttonImage, forState: UIControlState.Normal)
        }
    }
    
    
       
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pathGo.layer.cornerRadius = 35
        pathGo.clipsToBounds = true
        imageView1.layer.cornerRadius = 22.2
        imageView1.clipsToBounds = true
        join.layer.cornerRadius = join.frame.size.width / 2
        join.clipsToBounds = true

    }
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

