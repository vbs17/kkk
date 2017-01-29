
import UIKit

class Syutyu2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu3")
        self.present(basyoviewcontroller!, animated: true, completion: nil)
    }


}
