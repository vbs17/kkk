
import UIKit

class Rock2ViewController: UIViewController {

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
    
    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Rock3")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }
    

    @IBOutlet weak var gog: UIButton!
}
