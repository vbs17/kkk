
import UIKit

protocol Syugo11TableViewCellDelegate {
    func buttonPressed(_ tableViewCell: Syugo11TableViewCell)
}


class Syugo11TableViewCell: UITableViewCell {
    
    var delegate: Syugo11TableViewCellDelegate! = nil

    @IBOutlet weak var kete: UIButton!
    @IBOutlet weak var label: UILabel!

    @IBAction func kettei(_ sender: Any) {
        delegate.buttonPressed(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
