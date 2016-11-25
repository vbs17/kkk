
import UIKit

class IyaViewController: UIViewController {

    var songData:URL!

    @IBAction func go(_ sender: AnyObject) {
        let recviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top2") as! _TViewController
        recviewcontroller.songData = songData
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
