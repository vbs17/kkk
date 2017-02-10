

import UIKit

class Tyu3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        ud.set(true, forKey: CommonConst.IsTutorial)
        ud.synchronize()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginViewController!, animated: true, completion: nil)

    }

    @IBOutlet weak var gog: UIButton!
   
}
