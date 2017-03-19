

import UIKit

class Tyu4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
        LA.layer.cornerRadius = 7
        LA.clipsToBounds = true
        LA.layer.borderWidth = 3
        LA.layer.borderColor = UIColor.black.cgColor
        
        

    }

    @IBOutlet weak var LA: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var gog: UIButton!
    
    @IBAction func go(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu5")
        self.present(loginViewController!, animated: true, completion: nil)
    }

   
}
