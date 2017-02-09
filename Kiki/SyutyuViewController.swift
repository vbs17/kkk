

import UIKit

class SyutyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!

    @IBOutlet weak var gog: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu1")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)

    }
}
