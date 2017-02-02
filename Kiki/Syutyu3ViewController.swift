
import UIKit

class Syutyu3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu4")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }

  }
