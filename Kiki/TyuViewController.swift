
import UIKit

class TyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Go(sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Tyu2")
        self.presentViewController(loginViewController!, animated: true, completion: nil)

    }

   
}
