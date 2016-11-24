

import UIKit

class SyutyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu1")
        self.present(basyoviewcontroller!, animated: true, completion: nil)

    }
}
