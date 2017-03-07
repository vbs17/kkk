

import UIKit

protocol Kind1122TableViewCellDelegate : class {
    func buttonPressed(_ tableViewCell: Kind1122TableViewCell)
}

class Kind1122TableViewCell: UITableViewCell {
    weak var delegate: Kind1122TableViewCellDelegate! = nil

    @IBOutlet weak var label: UILabel!
    
    @IBAction func genreButton(_ sender: Any) {
        delegate.buttonPressed(self)

    }
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
