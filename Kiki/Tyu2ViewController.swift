

import UIKit

class Tyu2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
        ban.layer.cornerRadius = 7
        ban.clipsToBounds = true
        ban.layer.borderWidth = 2
        ban.layer.borderColor = UIColor.black.cgColor
        ban1.layer.cornerRadius = 7
        ban1.clipsToBounds = true
        ban1.layer.borderWidth = 2
        ban1.layer.borderColor = UIColor.black.cgColor
        ban2.layer.cornerRadius = 7
        ban2.clipsToBounds = true
        ban2.layer.borderWidth = 2
        ban2.layer.borderColor = UIColor.black.cgColor
        ban3.layer.cornerRadius = 7
        ban3.clipsToBounds = true
        ban3.layer.borderWidth = 2
        ban3.layer.borderColor = UIColor.black.cgColor




        


    }
    @IBOutlet weak var ban: UILabel!
    @IBOutlet weak var ban1: UILabel!
    @IBOutlet weak var ban2: UILabel!
    @IBOutlet weak var ban3: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var gog: UIButton!

    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu3")
        self.present(loginViewController!, animated: true, completion: nil)

    }
    
}
