
import UIKit

class Syutyu4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        ud.set(true, forKey: CommonConst.IsTutorial2)
        ud.synchronize()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func go(_ sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Basyo") as! BasyoViewController
        self.present(basyoviewcontroller, animated: true, completion: nil)
    }


}
