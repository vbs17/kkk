

import UIKit

class EventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = 2
        image.clipsToBounds = true
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        image2.layer.cornerRadius = 2
        image2.clipsToBounds = true
        image2.layer.borderWidth = 1
        image2.layer.borderColor = UIColor.white.cgColor
        da.layer.cornerRadius = 2
        da.clipsToBounds = true
        da.layer.borderWidth = 3
        da.layer.borderColor = UIColor.white.cgColor
        sa.layer.cornerRadius = 2
        sa.clipsToBounds = true
        sa.layer.borderWidth = 3
        sa.layer.borderColor = UIColor.white.cgColor

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!

    @IBOutlet weak var da: UIButton!
    @IBOutlet weak var sa: UIButton!
    @IBAction func s(_ sender: Any) {
    }
    @IBAction func d(_ sender: Any) {
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
