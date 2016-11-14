

import UIKit

class IkuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var proi: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView!.layer.cornerRadius = 66
        imageView?.clipsToBounds = true
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
