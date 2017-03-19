

import UIKit

class Itiran1TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageViewV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewV.layer.cornerRadius = imageViewV.frame.size.width / 2
        imageViewV.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
