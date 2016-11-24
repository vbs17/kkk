

import UIKit

protocol KindTableViewCellDelegate {
     func buttonPressed(_ tableViewCell: KindTableViewCell)
}

class KindTableViewCell: UITableViewCell {
    var delegate: KindTableViewCellDelegate! = nil

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func genreButton(_ sender: AnyObject) {
         delegate.buttonPressed(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    }

