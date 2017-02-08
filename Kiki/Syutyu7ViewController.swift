
import UIKit

class Syutyu7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu8")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }

  
}
