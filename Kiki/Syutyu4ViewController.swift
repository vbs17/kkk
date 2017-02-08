
import UIKit

class Syutyu4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu5")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)    }


}
