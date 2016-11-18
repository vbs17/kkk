

import UIKit

class SyutyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func go(sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Syutyu1")
        self.presentViewController(basyoviewcontroller!, animated: true, completion: nil)

    }
}
