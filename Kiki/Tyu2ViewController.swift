

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
        



        


    }
    @IBOutlet weak var ban: UILabel!
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var gog: UIButton!

    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu3")
        self.present(loginViewController!, animated: true, completion: nil)

    }
    
}
