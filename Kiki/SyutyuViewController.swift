

import UIKit

class SyutyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setBool(true, forKey: CommonConst.IsTutorial2)
        ud.synchronize()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func go(sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Basyo") as! BasyoViewController
        self.presentViewController(basyoviewcontroller, animated: true, completion: nil)

    }
}
