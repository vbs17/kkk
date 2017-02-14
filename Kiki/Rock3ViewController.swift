
import UIKit

class Rock3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        ud.set(true, forKey: CommonConst.IsTutorial3)
        ud.synchronize()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
        ba.layer.cornerRadius = 7
        ba.clipsToBounds = true
        ba.layer.borderWidth = 2
        ba.layer.borderColor = UIColor.black.cgColor
        ba1.layer.cornerRadius = 7
        ba1.clipsToBounds = true
        ba1.layer.borderWidth = 2
        ba1.layer.borderColor = UIColor.black.cgColor

    }

    @IBOutlet weak var ba: UILabel!
    @IBOutlet weak var ba1: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
                self.navigationController?.dismiss(animated: true, completion: {})
    }
    @IBOutlet weak var gog: UIButton!
}


