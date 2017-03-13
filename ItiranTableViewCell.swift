

import UIKit

class ItiranTableViewCell: UITableViewCell {
    
   var sanPostData: SanPostData!
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var imageViewVV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewVV.layer.cornerRadius = imageViewVV.frame.size.width / 2
        imageViewVV.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setPostData(_ postData: SanPostData){
            self.sanPostData = postData
    }
    
}
