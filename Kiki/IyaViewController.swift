
import UIKit

class IyaViewController: UIViewController {

    @IBAction func go(_ sender: AnyObject) {
        let recviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top2") as! _TViewController
        self.present(recviewcontroller, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
