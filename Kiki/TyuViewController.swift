
import UIKit

class TyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var gog: UIButton!
    
    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu2")
        self.present(loginViewController!, animated: true, completion: nil)

    }

   
}
