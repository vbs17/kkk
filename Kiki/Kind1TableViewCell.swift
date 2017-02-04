

import UIKit

protocol Kind1TableViewCellDelegate : class {
    func buttonPressed(_ tableViewCell: Kind1TableViewCell)
}

class Kind1TableViewCell: UITableViewCell {
    weak var delegate: Kind1TableViewCellDelegate! = nil
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!

    @IBAction func genreButton(_ sender: Any) {
        delegate.buttonPressed(self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
