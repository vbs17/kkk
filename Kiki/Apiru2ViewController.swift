
import UIKit

class Apiru2ViewController: UIViewController {
    var original:NSString?
    var cover:NSString?

    
    @IBOutlet weak var origui1: UIButton!
    @IBOutlet weak var covgui1: UIButton!
    @IBOutlet weak var oribas1: UIButton!
    @IBOutlet weak var covbas1: UIButton!
    @IBOutlet weak var oridru1: UIButton!
    @IBOutlet weak var covdru1: UIButton!
    @IBOutlet weak var oripia1: UIButton!
    @IBOutlet weak var covpia1: UIButton!
    @IBAction func oripia(_ sender: Any) {
        original = "O"
        cover = ""
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func covpia(_ sender: Any) {
        original = ""
        cover = "C"
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func origui(_ sender: Any) {
        original = "O"
        cover = ""
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func covgui(_ sender: Any) {
        original = ""
        cover = "C"
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }

    @IBAction func oribas(_ sender: Any) {
        original = "O"
        cover = ""
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func covbas(_ sender: Any) {
        original = ""
        cover = "C"
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func oridru(_ sender: Any) {
        original = "O"
        cover = ""
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func covdru(_ sender: Any) {
        original = ""
        cover = "C"
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    

}
