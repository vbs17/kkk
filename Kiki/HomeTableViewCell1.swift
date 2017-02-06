
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

    func setPostData(_ postData: PostData1, myid: String) {
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
    
    
    //これいる？
    func setPostData1(_ postData: PostData4, myid: String) {
    ImageView.image = postData.image
    }

    
       
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pathGo.layer.cornerRadius = pathGo.frame.size.width / 2
        pathGo.clipsToBounds = true
        pathGo.layer.borderWidth = 2
        pathGo.layer.borderColor = UIColor.white.cgColor
        imageView1.layer.cornerRadius = imageView1.frame.size.width / 2
        imageView1.clipsToBounds = true
        imageView1.layer.borderWidth = 1
        imageView1.layer.borderColor = UIColor.black.cgColor
        join.layer.cornerRadius = 22.2
        join.clipsToBounds = true
        join.layer.borderWidth = 3
        join.layer.borderColor = UIColor.white.cgColor
        iku.layer.cornerRadius = 22.2
        iku.clipsToBounds = true
        iku.layer.borderWidth = 3
        iku.layer.borderColor = UIColor.white.cgColor

        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

