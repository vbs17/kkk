

import UIKit

class ItiranTableViewCell: UITableViewCell {
    
   var sanPostData: SanPostData!
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var imageViewVV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewVV.layer.cornerRadius = 2
        imageViewVV.clipsToBounds = true
        imageViewVV.layer.borderWidth = 2
        imageViewVV.layer.borderColor = UIColor.purple.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setPostData(_ postData: SanPostData){
            self.sanPostData = postData
    }
    
}
