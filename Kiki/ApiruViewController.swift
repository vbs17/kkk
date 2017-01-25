
import UIKit

class ApiruViewController: UIViewController {

    var original:NSString?
    var cover:NSString?
    
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var ori1: UIButton!
    @IBOutlet weak var cover1: UIButton!
    @IBOutlet weak var origui1: UIButton!
    @IBOutlet weak var covgui1: UIButton!
    @IBOutlet weak var oribas1: UIButton!
    @IBOutlet weak var covbas1: UIButton!
    @IBOutlet weak var oridru1: UIButton!
    @IBOutlet weak var covdru1: UIButton!
    @IBAction func ori(_ sender: Any) {
        original = "O"
        cover = ""
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        viewcontroller.original = self.original
        viewcontroller.cover = self.cover
    }
    @IBAction func cover(_ sender: Any) {
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
        ori1.layer.cornerRadius = 2
        ori1.clipsToBounds = true
        ori1.layer.borderWidth = 1
        ori1.layer.borderColor = UIColor.white.cgColor
        cover1.layer.cornerRadius = 2
        cover1.clipsToBounds = true
        cover1.layer.borderWidth = 1
        cover1.layer.borderColor = UIColor.white.cgColor
        origui1.layer.cornerRadius = 2
        origui1.clipsToBounds = true
        origui1.layer.borderWidth = 1
        origui1.layer.borderColor = UIColor.white.cgColor
        covgui1.layer.cornerRadius = 2
        covgui1.clipsToBounds = true
        covgui1.layer.borderWidth = 1
        covgui1.layer.borderColor = UIColor.white.cgColor
        oribas1.layer.cornerRadius = 2
        oribas1.clipsToBounds = true
        oribas1.layer.borderWidth = 1
        oribas1.layer.borderColor = UIColor.white.cgColor
        covbas1.layer.cornerRadius = 2
        covbas1.clipsToBounds = true
        covbas1.layer.borderWidth = 1
        covbas1.layer.borderColor = UIColor.white.cgColor
        oridru1.layer.cornerRadius = 2
        oridru1.clipsToBounds = true
        oridru1.layer.borderWidth = 1
        oridru1.layer.borderColor = UIColor.white.cgColor
        covdru1.layer.cornerRadius = 2
        covdru1.clipsToBounds = true
        covdru1.layer.borderWidth = 1
        covdru1.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
}
