
import UIKit

class IyaViewController: UIViewController {

    @IBAction func go(sender: AnyObject) {
        let recviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Top2") as! _TViewController
        self.presentViewController(recviewcontroller, animated: true, completion: nil)
    }
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
