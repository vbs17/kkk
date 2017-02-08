

import UIKit

class Syutyu5ViewController: UIViewController {
    
    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syutyu6")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
