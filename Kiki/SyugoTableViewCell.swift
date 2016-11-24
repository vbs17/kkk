
import UIKit

protocol SyugoTableViewCellDelegate {
    func buttonPressed(_ tableViewCell: SyugoTableViewCell)
}

class SyugoTableViewCell: UITableViewCell {
    
     var delegate: SyugoTableViewCellDelegate! = nil

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var kete: UIButton!
    
    @IBAction func kettei(_ sender: AnyObject) {
        delegate.buttonPressed(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
