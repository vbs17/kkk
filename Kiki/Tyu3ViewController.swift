

import UIKit

class Tyu3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
        ban.layer.cornerRadius = 7
        ban.clipsToBounds = true
        ban.layer.borderWidth = 3
        ban.layer.borderColor = UIColor.black.cgColor
        ban2.layer.cornerRadius = 7
        ban2.clipsToBounds = true
        ban2.layer.borderWidth = 3
        ban2.layer.borderColor = UIColor.black.cgColor




    }

    @IBOutlet weak var ban: UILabel!
    @IBOutlet weak var ban2: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu4")
        self.present(loginViewController!, animated: true, completion: nil)
    }

    @IBOutlet weak var gog: UIButton!
   
}
