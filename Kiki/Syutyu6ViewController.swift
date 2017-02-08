
import UIKit

class Syutyu6ViewController: UIViewController {

    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu7")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}
