
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
    
    @IBOutlet weak var o: UIImageView!
    @IBOutlet weak var c: UIImageView!
    @IBOutlet weak var v: UIImageView!
    @IBOutlet weak var t: UIImageView!
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
        t.layer.cornerRadius = 10
        t.clipsToBounds = true
        t.layer.borderWidth = 1
        t.layer.borderColor = UIColor.white.cgColor
        c.layer.cornerRadius = 10
        c.clipsToBounds = true
        c.layer.borderWidth = 1
        c.layer.borderColor = UIColor.white.cgColor
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.white.cgColor
        o.layer.cornerRadius = 10
        o.clipsToBounds = true
        o.layer.borderWidth = 1
        o.layer.borderColor = UIColor.white.cgColor
        oripia1.layer.cornerRadius = 7
        oripia1.clipsToBounds = true
        oripia1.layer.borderWidth = 1
        oripia1.layer.borderColor = UIColor.white.cgColor
        covpia1.layer.cornerRadius = 7
        covpia1.clipsToBounds = true
        covpia1.layer.borderWidth = 1
        covpia1.layer.borderColor = UIColor.white.cgColor
        origui1.layer.cornerRadius = 7
        origui1.clipsToBounds = true
        origui1.layer.borderWidth = 1
        origui1.layer.borderColor = UIColor.white.cgColor
        covgui1.layer.cornerRadius = 7
        covgui1.clipsToBounds = true
        covgui1.layer.borderWidth = 1
        covgui1.layer.borderColor = UIColor.white.cgColor
        covbas1.layer.cornerRadius = 7
        covbas1.clipsToBounds = true
        covbas1.layer.borderWidth = 1
        covbas1.layer.borderColor = UIColor.white.cgColor
        oribas1.layer.cornerRadius = 7
        oribas1.clipsToBounds = true
        oribas1.layer.borderWidth = 1
        oribas1.layer.borderColor = UIColor.white.cgColor
        covdru1.layer.cornerRadius = 7
        covdru1.clipsToBounds = true
        covdru1.layer.borderWidth = 1
        covdru1.layer.borderColor = UIColor.white.cgColor
        oridru1.layer.cornerRadius = 7
        oridru1.clipsToBounds = true
        oridru1.layer.borderWidth = 1
        oridru1.layer.borderColor = UIColor.white.cgColor

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    

}
