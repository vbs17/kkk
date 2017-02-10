
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
                self.navigationController?.dismiss(animated: true, completion: {})
    }
    @IBOutlet weak var gog: UIButton!
}
   

