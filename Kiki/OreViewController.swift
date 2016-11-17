

import UIKit

class OreViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var back1: UIButton!
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        back1.layer.cornerRadius = back1.frame.size.width / 2
        back1.clipsToBounds = true
        text.layer.cornerRadius = 7
        text.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  }
