import UIKit

class DyuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: Any) {
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "sine")
        self.present(ProViewController!, animated: true, completion: nil)
    }

    @IBAction func b(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
}
