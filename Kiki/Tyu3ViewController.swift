

import UIKit

class Tyu3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setBool(true, forKey: CommonConst.IsTutorial)
        ud.synchronize()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Go(sender: AnyObject) {
        let loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(loginViewController!, animated: true, completion: nil)

    }

   
}
