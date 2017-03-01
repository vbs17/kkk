
import UIKit

class FuckViewController: UIViewController {

    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image: UIButton!
    @IBAction func back(_ sender: Any) {
    }
    @IBAction func genre(_ sender: Any) {
    }
    @IBAction func artist(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.white.cgColor
        image1.layer.cornerRadius = 5
        image1.clipsToBounds = true
        image1.layer.borderWidth = 2
        image1.layer.borderColor = UIColor.white.cgColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   }
