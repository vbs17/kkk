
import UIKit

class ApiruViewController: UIViewController {

    var original:NSString?
    var cover:NSString?
    
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var ori1: UIButton!
    @IBOutlet weak var cover1: UIButton!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBOutlet weak var ensou1: UIButton!
    
    @IBAction func ensou(_ sender: Any) {
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Apiru2") as! Apiru2ViewController
        self.present(viewcontroller, animated: true, completion: nil)
    }
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ori1.layer.cornerRadius = 7
        ori1.clipsToBounds = true
        cover1.layer.cornerRadius = 7
        cover1.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
}
