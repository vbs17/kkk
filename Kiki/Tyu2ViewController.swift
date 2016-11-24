

import UIKit

class Tyu2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu3")
        self.present(loginViewController!, animated: true, completion: nil)

    }
    
}
