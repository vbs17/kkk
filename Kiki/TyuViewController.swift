
import UIKit

class TyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Go(_ sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tyu2")
        self.present(loginViewController!, animated: true, completion: nil)

    }

   
}
