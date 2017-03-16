
import UIKit

class sineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ty.layer.cornerRadius = 2
        ty.clipsToBounds = true
        ty.layer.borderWidth = 1
        ty.layer.borderColor = UIColor.white.cgColor
        n.layer.cornerRadius = 10
        n.clipsToBounds = true
        n.layer.borderWidth = 1
        n.layer.borderColor = UIColor.white.cgColor

    }

    @IBOutlet weak var n: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var ty: UIButton!

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
}
