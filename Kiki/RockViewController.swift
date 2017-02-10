
import UIKit

class RockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
        ori1.layer.cornerRadius = 7
        ori1.clipsToBounds = true
        ori1.layer.borderWidth = 1
        ori1.layer.borderColor = UIColor.white.cgColor
        cov1.layer.cornerRadius = 7
        cov1.clipsToBounds = true
        cov1.layer.borderWidth = 1
        cov1.layer.borderColor = UIColor.white.cgColor
        ensou1.layer.cornerRadius = 7
        ensou1.clipsToBounds = true
        ensou1.layer.borderWidth = 1
        ensou1.layer.borderColor = UIColor.white.cgColor
        
    }
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var ori1: UILabel!
    @IBOutlet weak var cov1: UILabel!
    @IBOutlet weak var ensou1: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Rock2")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }
   
    @IBOutlet weak var gog: UIButton!
}
