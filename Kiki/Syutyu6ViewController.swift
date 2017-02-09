
import UIKit

class Syutyu6ViewController: UIViewController {

    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu7")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor

    }
    @IBOutlet weak var label: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBOutlet weak var gog: UIButton!
   
}
