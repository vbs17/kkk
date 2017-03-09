

import UIKit

class ItiranTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var imageViewVV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
