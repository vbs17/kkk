

import UIKit

class IkuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var proi: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageview!.layer.cornerRadius = imageview.frame.size.width / 2
        imageview?.clipsToBounds = true
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
