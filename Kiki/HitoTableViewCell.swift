
import UIKit

class HitoTableViewCell: UITableViewCell {

    @IBOutlet weak var iimageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
